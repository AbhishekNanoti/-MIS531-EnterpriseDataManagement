using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 

namespace TripActions
{
    public partial class Login : Page
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
            if (menu != null)
            {
                menu.Visible = false;
            }
            Control navemp = Page.Master.FindControl("EmpMenu");
            if (navemp != null)
            {
                navemp.Visible = false;
            }
        }

        protected void Btnlogin_Click(object sender, EventArgs e)
        {
            
            lblmsg.Text = "";
            var connStr = ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString();

            using (var conn = new Oracle.ManagedDataAccess.Client.OracleConnection(connStr))
            {

                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    try
                    {
                        conn.Open();

                        var cmdText1 = "select user_validations.login_validation('" + txtuname.Text + "','" + txtpassword.Text + "') from dual";

                        var pass_query = new Oracle.ManagedDataAccess.Client.OracleCommand(cmdText1, conn);

                        OracleDataReader reader1 = pass_query.ExecuteReader();

                        var cmdText2 = "SELECT empID FROM CC_Emp_logins_username WHERE username = '" + txtuname.Text + "'";

                        var e_query = new Oracle.ManagedDataAccess.Client.OracleCommand(cmdText2, conn);

                        OracleDataReader reader2 = e_query.ExecuteReader();

                        if (reader1.HasRows)
                        {

                            while (reader1.Read())
                            {
                                if (reader2.HasRows)
                                {

                                    while (reader2.Read())
                                    {
                                        string msg = reader1.GetString(0);
                                        if (msg == "managertype")
                                        {
                                            Session["type"] = "managertype";
                                            string empID = reader2.GetString(0);
                                            Session["empID"] = empID;
                                            Response.Redirect("Home.aspx");
                                        }
                                        else if (msg == "emptype")
                                        {
                                            Session["type"] = "emptype";
                                            string empID = reader2.GetString(0);
                                            Session["empID"] = empID;
                                            Response.Redirect("HomeEmp.aspx");
                                        }
                                        else
                                        {
                                            lblmsg.Text = "Invalid username/password. To reset, contact admin.";
                                            txtuname.Text = "";
                                            txtuname.Focus();
                                        }
                                    }
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblmsg.Text = ex.Message;
                        txtuname.Text = "";
                        txtuname.Focus();
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