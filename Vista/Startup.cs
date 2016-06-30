using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Vista.Startup))]
namespace Vista
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
