using System.Web;
using System.Web.Mvc;

namespace Winny_Test_DeepakKansara
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
