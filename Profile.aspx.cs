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
    public partial class Profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["empID"]) == null || Convert.ToString(Session["empID"]) == "")
            {
                Response.Redirect("Default.aspx");
            }

            Control nav = Page.Master.FindControl("Default");
            if (nav != null)
            {
                nav.Visible = false;
            }
        }
        protected void Btnsubmit_Click(object sender, EventArgs e)
        {
            lblmsg.Text = "";

            var connStr = ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString();

            using (var conn = new Oracle.ManagedDataAccess.Client.OracleConnection(connStr))
            {

                var cmdText1 = "insert into reimbursements (expensedate,location,amount,modeofexpense,typeofexpenseincurred,empid,status) values(" + "TO_Date('" + txtdate.Text + "','DD/MM/YYYY'),'" + txtloc.Text + "','" + txtamount.Text + "','" + txtexpense.Text + "','" + txttype.Text + "','" + Session["empID"].ToString() + "','Pending')";
                
                var u_query = new Oracle.ManagedDataAccess.Client.OracleCommand(cmdText1, conn);

                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    try
                    {
                        conn.Open();

                        u_query.ExecuteNonQuery();

                        lblmsg.Text = "Successfully submitted the reimbursement claim! Go to My Claims to view it. ";
                        txtempid.Text = "";
                        txtdate.Text = "";
                        txtloc.Text = "";
                        txtamount.Text = "";
                        txtexpense.Text = "";
                        txttype.Text = "";
                        txtempid.Focus();
                              
                    }
                    catch (Exception ex)
                    {
                        lblmsg.Text = ex.Message;
                        txtempid.Text = "";
                        txtdate.Text = "";
                        txtloc.Text = "";
                        txtamount.Text = "";
                        txtexpense.Text = "";
                        txttype.Text = "";
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