using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Configuration;
using System.Data;
using System.Windows;

namespace Park
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static Model.ParkContext Context { get; set; } = new Model.ParkContext();

        public static Model.User CurrrentUser { get; set; } = null;
    }

}
