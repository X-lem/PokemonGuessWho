using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PokemonGuessWho.Startup))]
namespace PokemonGuessWho
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
