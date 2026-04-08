using System.Windows;

namespace Park
{
    public partial class App : Application
    {
        public static Model.ParkDbContext Context { get; set; } = new Model.ParkDbContext();
        public static Model.User? CurrrentUser { get; set; } = null;
    }
}