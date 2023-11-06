using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TripActions
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
            Control nav = Page.Master.FindControl("Home");
            if (nav != null)
            {
                nav.Visible = false;
            }
            Control navhome = Page.Master.FindControl("HomeEmp");
            if (navhome != null)
            {
                navhome.Visible = false;
            }
            Control menu = Page.Master.FindControl("MainMenu");
            if(menu != null)
            {
                menu.Visible = false;
            }
            Control navemp = Page.Master.FindControl("EmpMenu");
            if (navemp != null)
            {
                navemp.Visible = false;
            }

        }
    }
}