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
    public partial class NewEmployee : Page
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

            var connStr = ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString();

            using (var conn = new Oracle.ManagedDataAccess.Client.OracleConnection(connStr))
            {

                var cmdText1 = "INSERT INTO CC_EMPLOYEES (FNAME, ADDRESS, DATEOFJOINING, DATEOFBIRTH, GENDER, COMPANYID, LNAME) VALUES('" + txtfname.Text + "','" + txtadd.Text + "', TO_Date('" + txtdoj.Text + "','DD/MM/YYYY')," + " TO_Date('" + txtdob.Text + "','DD/MM/YYYY'),'" + txtgen.Text + "','" + txtcid.Text + "','" + txtlname.Text + "')";
                
                var e_query = new Oracle.ManagedDataAccess.Client.OracleCommand(cmdText1, conn);

                var cmdText2 = "SELECT LPAD(to_char(cc_employees_seq.currVal),4,'E') FROM dual";

                var s_query = new Oracle.ManagedDataAccess.Client.OracleCommand(cmdText2, conn);

                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    try
                    {
                        conn.Open();

                        e_query.ExecuteNonQuery();
                        OracleDataReader reader1 = s_query.ExecuteReader();

                        if (reader1.HasRows)
                        {

                            while (reader1.Read())
                            {
                                string empid = reader1.GetString(0);

                                var cmdText3 = "INSERT INTO CC_MANAGES VALUES('" + Session["empID"].ToString() + "','" + empid +"')";

                                var m_query = new Oracle.ManagedDataAccess.Client.OracleCommand(cmdText3, conn);

                                m_query.ExecuteNonQuery();

                                lblmsg.Text = "Successfully enrolled the employee!";
                                btnclick.Text = "<a href='./Employees'>Click here to view</a>";
                            }

                        }
                              
                    }
                    catch (Exception ex)
                    {
                        lblmsg.Text = ex.Message;

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