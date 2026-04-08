using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace Park.Pages
{
    public partial class AuthPage : Page
    {
        public AuthPage()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            string login = LoginBox.Text.Trim();
            string password = PasswordBox.Password;

            // Проверка на пустые поля
            if (string.IsNullOrEmpty(login) || string.IsNullOrEmpty(password))
            {
                ErrorText.Text = "Введите логин и пароль!";
                return;
            }

            // Ищем пользователя в базе данных
            var user = App.Context.Users
                .FirstOrDefault(u => u.Login == login && u.Password == password);

            if (user == null)
            {
                ErrorText.Text = "Неверный логин или пароль!";
                return;
            }

            if (user.Block == true)
            {
                ErrorText.Text = "Ваш аккаунт заблокирован!";
                return;
            }

            // Сохраняем текущего пользователя
            App.CurrrentUser = user;

            // Роль 1 = Администратор, остальные = обычный пользователь
            if (user.Role == 1)
            {
                NavigationService.Navigate(new AdminMenuPage());
            }
            else
            {
                NavigationService.Navigate(new UserPage());
            }
        }
    }
}