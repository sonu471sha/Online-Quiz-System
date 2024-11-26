using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quiz
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Admin_login.aspx");
            }

            else
            {
                Label1.Text =  Session["userid"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // code to release the system and logout
            string us_id = Session["userid"].ToString();
            using (SqlConnection connectionString = new SqlConnection(ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString))
            {
                connectionString.Open();
                string query = "UPDATE admin SET system_taken = @n WHERE userid = @id";
                using (SqlCommand cmd = new SqlCommand(query, connectionString))
                {
                    cmd.Parameters.AddWithValue("@n", "no");
                    cmd.Parameters.AddWithValue("@id", us_id);

                    cmd.ExecuteNonQuery();

                }
            }
            Session.Clear();
            Response.Redirect("Admin_login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // code to delete entire ques_list

            string sqlConnectionString = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
            string query = "TRUNCATE TABLE ques_book";
            using (SqlConnection connection = new SqlConnection(sqlConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.ExecuteNonQuery();
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            // code to delete entire result table

            string sqlConnectionString = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(sqlConnectionString))
            {
                connection.Open();
                string query1 = "TRUNCATE table result";
                using (SqlCommand command = new SqlCommand(query1, connection))
                {
                    command.ExecuteNonQuery();
                }
                string script = "alert ('Result Data Deleted.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            // code to delete all item in folder ResultCompleteData
            string folderPath = Server.MapPath("./ResultCompleteData/");

            // Get all the items in the folder
            string[] files = Directory.GetFiles(folderPath);
            foreach (string file in files)
            {
                File.Delete(file);
            }
        }
    }
}