using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace Park.Pages
{
    public partial class AdminMenuPage : Page
    {
        public AdminMenuPage()
        {
            InitializeComponent();
            TextCurrentUser.Text = App.CurrrentUser.LastName + " "
                                 + App.CurrrentUser.FirstName;
            if (App.CurrrentUser.Role != 1)
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
            MessageBox.Show("Данный функционал ещё не реализован!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void BtnOrder_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Данный функционал ещё не реализован!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void BtnRoom_Clickc(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Данный функционал ещё не реализован!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
        }
    }
}