using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Park.Pages
{
    /// <summary>
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        public UserPage()
        {
            InitializeComponent();
            UserDataGrid.ItemsSource = App.Context.Users.ToList();
        }

        private void BtnAddUser_Click(object sender, RoutedEventArgs e)
        {
            Windows.AddUserWindow addUser = new Windows.AddUserWindow();
            if (addUser.ShowDialog() == true )
            {
                UserDataGrid.ItemSource = App.Context.Users.ToList();
            }
        }

        private void BtnSaveChanges_CLick(object sender, RoutedEventArgs e)
        {
            try
            {
                if (MessageBox.Show("Сохранить изменения?", "Редактирование данных!", MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.Yes)
                {
                    App.Context.SaveChanges();
                    UserDataGrid.ItemsSource = App.Context.Users.ToList();
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Ошибка в сохранении изменений! Проверьте введенные данные", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
