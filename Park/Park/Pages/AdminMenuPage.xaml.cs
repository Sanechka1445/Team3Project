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
    /// Логика взаимодействия для AdminMenuPage.xaml
    /// </summary>
    public partial class AdminMenuPage : Page
    {
        public AdminMenuPage()
        {
            InitializeComponent();
            TextCurrentUser.Text = App.CurrrentUser.fullName;

            if (App.CurrrentUser.Role == 2)
            {
                BtnUser.Visibility = Visibility.Collapsed;
                BtnRoom.Visibility = Visibility.Collapsed;
            }
        }

        private void BtnUser_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new UserPage());
        }

        private void BtnClient_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Данный функционал ещё не риавлизован!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void BtnOrder_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Данный функционал ещё не ривализован!","Внимание!", MessageBoxButton.OK, MessageBoxImage.Information );
        }

        private void BtnRoom_Clickc(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Данный функционал ещё не риализован!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information );
        }
    }
}
