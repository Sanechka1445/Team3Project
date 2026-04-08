using System;
using System.Windows;
using System.Windows.Controls;

namespace Park.Pages
{
    public partial class UserPage : Page
    {
        public UserPage()
        {
            InitializeComponent();
            // TODO: раскомментировать после создания Model
            // UserDataGrid.ItemsSource = App.Context.Users.ToList();
        }

        private void BtnAddUser_Click(object sender, RoutedEventArgs e)
        {
            Windows.AddUserWindow addUser = new Windows.AddUserWindow();
            if (addUser.ShowDialog() == true)
            {
                // UserDataGrid.ItemsSource = App.Context.Users.ToList();
            }
        }

        private void BtnSaveChanges_CLick(object sender, RoutedEventArgs e)
        {
            try
            {
                if (MessageBox.Show("Сохранить изменения?", "Редактирование данных!", MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.Yes)
                {
                    // App.Context.SaveChanges();
                    // UserDataGrid.ItemsSource = App.Context.Users.ToList();
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Ошибка в сохранении изменений! Проверьте введенные данные", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}