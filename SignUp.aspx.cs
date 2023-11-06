using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Types;
using Oracle.ManagedDataAccess.Client;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TripActions
{
    public partial class SignUp : Page
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
        protected void Btnregistration_Click(object sender, EventArgs e)
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

                        var cmdText1 = "select user_validations.signup_validation('" + txtempid.Text + "','" + txtuname.Text + "','" + txtpassword.Text + "','" + txtemail.Text + "','" + txtcontact.Text + "') from dual";

                        var pass_query = new Oracle.ManagedDataAccess.Client.OracleCommand(cmdText1, conn);

                        OracleDataReader reader1 = pass_query.ExecuteReader();

                        if (reader1.HasRows)
                        {

                            while (reader1.Read())
                            {

                                lblmsg.Text = reader1.GetString(0);
                                txtempid.Text = "";
                                txtuname.Text = "";
                                txtemail.Text = "";
                                txtcontact.Text = "";
                                txtempid.Focus();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblmsg.Text = ex.Message;
                        txtempid.Text = "";
                        txtuname.Text = "";
                        txtemail.Text = "";
                        txtcontact.Text = "";
                        txtempid.Focus();
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