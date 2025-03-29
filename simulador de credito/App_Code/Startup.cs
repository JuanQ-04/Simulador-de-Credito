using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(simulador_de_credito.Startup))]
namespace simulador_de_credito
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
