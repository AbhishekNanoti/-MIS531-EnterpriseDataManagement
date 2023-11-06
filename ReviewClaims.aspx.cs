using System;
using System.Threading;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;
using System.Configuration;

namespace TripActions
{
    public partial class ReviewClaims : System.Web.UI.Page
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

        public void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ApproveClaim")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = GridView1.Rows[rowIndex];

                //Fetch value of Name.
                //string name = (row.FindControl("txtName") as TextBox).Text;

                //Fetch value of Country
                string rid = row.Cells[0].Text;

                var connStr = ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString();

                using (var conn = new Oracle.ManagedDataAccess.Client.OracleConnection(connStr))
                {

                    if (conn.State == System.Data.ConnectionState.Closed)
                    {
                        try
                        {
                            conn.Open();
                            var cmdText1 = "UPDATE REIMBURSEMENTS SET STATUS = 'Approved' WHERE reimbursementid = '" + rid + "'";

                            var u_query = new Oracle.ManagedDataAccess.Client.OracleCommand(cmdText1, conn);

                            u_query.ExecuteReader();


                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Claim Approved');window.location.href='ReviewClaims.aspx';", true);
                            Thread.Sleep(3000);
                            //Response.Redirect("ReviewClaims.aspx");
                            //System.threading.Thread.Sleep("3000");
                            //Response.AddHeader("REFRESH", "10;URL=ReviewClaims.aspx");

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
            if (e.CommandName == "RejectClaim")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = GridView1.Rows[rowIndex];

                string rid = row.Cells[0].Text;

                var connStr = ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString();

                using (var conn = new Oracle.ManagedDataAccess.Client.OracleConnection(connStr))
                {

                    if (conn.State == System.Data.ConnectionState.Closed)
                    {
                        try
                        {
                            conn.Open();
                            var cmdText1 = "UPDATE REIMBURSEMENTS SET STATUS = 'Declined' WHERE reimbursementid = '" + rid + "'";

                            var u_query = new Oracle.ManagedDataAccess.Client.OracleCommand(cmdText1, conn);

                            u_query.ExecuteReader();

                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Claim Reject');window.location.href='ReviewClaims.aspx';", true);
                            Thread.Sleep(3000);

                            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(ex.Message);", true);
                            //Response.Redirect("ReviewClaims.aspx");


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
}