using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quiz
{
    public partial class WebForm10 : System.Web.UI.Page
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
                    // code to fill result table or data to gridview
                    string sqlConnectionString = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
                    string query = "SELECT * FROM result";
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
            // code to delete individual result data
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string test_nam = GridView1.Rows[e.RowIndex].Cells[1].Text;


            string sqlConnectionString = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(sqlConnectionString))
            {
                connection.Open();
                string query1 = "DELETE FROM result WHERE userid = @ID AND test_name = @test_nam";
                using (SqlCommand command = new SqlCommand(query1, connection))
                {
                    command.Parameters.AddWithValue("@ID", id);
                    command.Parameters.AddWithValue("@test_nam", test_nam);

                    command.ExecuteNonQuery();
                }
            }

            GridView1.DataBind();
            Response.Redirect(Request.RawUrl);

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            {
                // code to delete all result data
                string sqlConnectionString = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(sqlConnectionString))
                {
                    connection.Open();
                    string query1 = "TRUNCATE table result";
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