using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TripActions
{
    public partial class Employees : System.Web.UI.Page
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
        protected void Insert_OnClick(object sender, EventArgs e)
        {
            var connStr = ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString();

            using (var conn = new Oracle.ManagedDataAccess.Client.OracleConnection(connStr))
            {

                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    try
                    {
                        conn.Open();
                        OracleCommand cmdproc = new OracleCommand();

                        cmdproc.Connection = conn;
                        cmdproc.CommandText = "EXEC EMPLOYEEINSERTION(:FNAME, :ADDRESS, :DATEOFJOINING, :DATEOFBIRTH, :GENDER, :COMPANYID, :LNAME, :MANAGERID)";
                        cmdproc.CommandType = CommandType.StoredProcedure;
                        cmdproc.Parameters.Add(":FNAME", DetailsView1.Rows[1].Cells[0].Text);
                        cmdproc.Parameters.Add(":ADDRESS", DetailsView1.Rows[2].Cells[0].Text);
                        cmdproc.Parameters.Add(":DATEOFJOINING", DetailsView1.Rows[3].Cells[0].Text);
                        cmdproc.Parameters.Add(":DATEOFBIRTH", DetailsView1.Rows[4].Cells[0].Text);
                        cmdproc.Parameters.Add(":GENDER", DetailsView1.Rows[5].Cells[0].Text);
                        cmdproc.Parameters.Add(":COMPANYID", DetailsView1.Rows[6].Cells[0].Text);
                        cmdproc.Parameters.Add(":LNAME", DetailsView1.Rows[7].Cells[0].Text);
                        cmdproc.Parameters.Add(":MANAGERID", Session["empID"].ToString());
                        cmdproc.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        System.Console.WriteLine("Exception: {0}", ex.ToString());
                    }
                    conn.Close();
                }
            }

        }
    }
}