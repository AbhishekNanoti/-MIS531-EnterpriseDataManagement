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
    public partial class ClaimForm : Page
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
            Control navhome = Page.Master.FindControl("HomeEmp");
            if (navhome != null)
            {
                navhome.Visible = false;
            }
            Control navemp = Page.Master.FindControl("EmpMenu");
            if (navemp != null)
            {
                navemp.Visible = false;
            }
        }
        protected void Btnsubmit_Click(object sender, EventArgs e)
        {
            lblmsg.Text = "";
            var datefield = txtdate.Text.ToString();

            var connStr = ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString();

            using (var conn = new Oracle.ManagedDataAccess.Client.OracleConnection(connStr))
            {

                var cmdText1 = "insert into reimbursements (expensedate,location,amount,modeofexpense,typeofexpenseincurred,empid,status) values(" + "TO_Date('" + txtdate.Text + "','DD/MM/YYYY'),'" + txtloc.Text + "','" + txtamount.Text + "','" + ModeID.SelectedItem.Text.Trim() + "','" + txttype.Text + "','" + Session["empID"].ToString() + "','Pending')";
                
                var u_query = new Oracle.ManagedDataAccess.Client.OracleCommand(cmdText1, conn);

                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    try
                    {
                        conn.Open();

                        u_query.ExecuteNonQuery();

                        lblmsg.Text = "Successfully submitted the reimbursement claim!";
                        btnclick.Text = "<a href='./ViewClaims'>Click here to view it</a>";
                        txtdate.Text = "";
                        txtloc.Text = "";
                        txtamount.Text = "";
                        txtexpense.Text = "";
                        txttype.Text = "";
                              
                    }
                    catch (Exception ex)
                    {
                        lblmsg.Text = ex.Message;
                        txtdate.Text = "";
                        txtloc.Text = "";
                        txtamount.Text = "";
                        txtexpense.Text = "";
                        txttype.Text = "";
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