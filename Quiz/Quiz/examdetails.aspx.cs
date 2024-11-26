using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quiz
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Admin_login.aspx");
            }
            else
            {
                // update exam time and name from text file
                string filePath = Server.MapPath("./Text_file/TextFile1.txt");
                using (StreamReader reader = new StreamReader(filePath))
                {
                    string exa_time = reader.ReadLine();
                    string exa_nam = reader.ReadLine();

                    Label1.Text = exa_time;
                    Label2.Text = exa_nam;


                }
                // update all the question from database to gridview
                string sqlConnectionString = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
                string query = "SELECT * FROM ques_book";
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
}