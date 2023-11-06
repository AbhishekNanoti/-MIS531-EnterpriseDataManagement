using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;

namespace TripActions
{
    public partial class HomeEmp : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Control nav = Page.Master.FindControl("Default");
            if (nav != null)
            {
                nav.Visible = false;
            }
            Control navhome = Page.Master.FindControl("Home");
            if (navhome != null)
            {
                navhome.Visible = false;
            }
            Control navemp = Page.Master.FindControl("MainMenu");
            if (navemp != null)
            {
                navemp.Visible = false;
            }

            var connStr = ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString();

            using (var conn = new Oracle.ManagedDataAccess.Client.OracleConnection(connStr))
            {

                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    try
                    {
                        conn.Open();
                        var cmdText1 = "SELECT FNAME FROM CC_EMPLOYEES WHERE EMPID ='" + Session["empID"].ToString() + "'";

                        var u_query = new Oracle.ManagedDataAccess.Client.OracleCommand(cmdText1, conn);

                        OracleDataReader reader1 = u_query.ExecuteReader();

                        if (reader1.HasRows)
                        {

                            while (reader1.Read())
                            {
                                string empName = reader1.GetString(0);
                                Session["empName"] = empName;

                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(ex.Message);", true);

                    }
                    finally
                    {
                        conn.Close();
                    }
                }

            }
    }
    }
}