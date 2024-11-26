using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Configuration;

namespace Quiz
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Admin_login.aspx");
            }
            else
            {

                if (!IsPostBack)
                {
                    // code to fill student data
                    string sqlConnectionString = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
                    string query = "SELECT * FROM students";
                    using (SqlConnection connection = new SqlConnection(sqlConnectionString))
                    {
                        connection.Open();
                        using (SqlDataAdapter adapter = new SqlDataAdapter(query, sqlConnectionString))
                        {
                            DataTable table = new DataTable();
                            adapter.Fill(table);
                            GridView1.DataSource = table;
                            GridView1.DataBind();

                        }
                    }
                }



            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // code to delete individual student data
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string sqlConnectionString = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(sqlConnectionString))
            {
                connection.Open();
                string query1 = "DELETE FROM students WHERE userid = @ID";
                using (SqlCommand command = new SqlCommand(query1, connection))
                {
                    command.Parameters.AddWithValue("@ID", id);
                    command.ExecuteNonQuery();
                }
            }

            GridView1.DataBind();
            Response.Redirect(Request.RawUrl);

        }




        protected void Button1_Click(object sender, EventArgs e)
        {
            {
                // code to delete all student data
                string sqlConnectionString = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(sqlConnectionString))
                {
                    connection.Open();
                    string query1 = "TRUNCATE table students";
                    using (SqlCommand command = new SqlCommand(query1, connection))
                    {
                        command.ExecuteNonQuery();
                    }
                }

                GridView1.DataBind();
                Response.Redirect(Request.RawUrl);

            }
        }
    }
}