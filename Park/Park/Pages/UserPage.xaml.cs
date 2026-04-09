using System;

using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace Park.Pages
{
    public partial class UserPage : Page
    {
        // Храним полный список пользователей
        private List<Model.User> _allUsers = new List<Model.User>();

        public UserPage()
        {
            InitializeComponent();
            LoadUsers();
        }

        // Загружаем всех пользователей из БД
        private void LoadUsers()
        {
            _allUsers = App.Context.Users.ToList();
            ApplyFilters();
        }

        // Применяем поиск + фильтр + сортировку
        private void ApplyFilters()
        {
            var result = _allUsers.AsEnumerable();

            // Поиск по фамилии или имени
            string search = SearchBox.Text.Trim().ToLower();
            if (!string.IsNullOrEmpty(search))
            {
                result = result.Where(u =>
                    (u.LastName != null && u.LastName.ToLower().Contains(search)) ||
                    (u.FirstName != null && u.FirstName.ToLower().Contains(search)) ||
                    (u.Patronymic != null && u.Patronymic.ToLower().Contains(search)));
            }

            // Фильтр по статусу блокировки
            if (FilterComboBox.SelectedItem is ComboBoxItem filterItem)
            {
                switch (filterItem.Content.ToString())
                {
                    case "Активные":
                        result = result.Where(u => u.Block == false);
                        break;
                    case "Заблокированные":
                        result = result.Where(u => u.Block == true);
                        break;
                }
            }

            // Сортировка
            if (SortComboBox.SelectedItem is ComboBoxItem sortItem)
            {
                switch (sortItem.Content.ToString())
                {
                    case "По фамилии А-Я":
                        result = result.OrderBy(u => u.LastName);
                        break;
                    case "По фамилии Я-А":
                        result = result.OrderByDescending(u => u.LastName);
                        break;
                    case "По имени А-Я":
                        result = result.OrderBy(u => u.FirstName);
                        break;
                    case "По имени Я-А":
                        result = result.OrderByDescending(u => u.FirstName);
                        break;
                }
            }

            UserDataGrid.ItemsSource = result.ToList();
        }

        // Поиск при вводе текста
        private void SearchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            ApplyFilters();
        }

        // Фильтр при выборе статуса
        private void FilterComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (UserDataGrid != null)
                ApplyFilters();
        }

        // Сортировка при выборе
        private void SortComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (UserDataGrid != null)
                ApplyFilters();

            // TODO: раскомментировать после создания Model
            // UserDataGrid.ItemsSource = App.Context.Users.ToList();
        }

        private void BtnAddUser_Click(object sender, RoutedEventArgs e)
        {
            Windows.AddUserWindow addUser = new Windows.AddUserWindow();
            if (addUser.ShowDialog() == true)
            {
                LoadUsers();
            }
        }

        private void BtnSaveChanges_CLick(object sender, RoutedEventArgs e)
        {
            try
            {
                if (MessageBox.Show("Сохранить изменения?", "Редактирование данных!",
                    MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.Yes)
                {
                    App.Context.SaveChanges();
                    LoadUsers();
                    // App.Context.SaveChanges();
                    // UserDataGrid.ItemsSource = App.Context.Users.ToList();
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Ошибка в сохранении изменений!", "Ошибка!",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}