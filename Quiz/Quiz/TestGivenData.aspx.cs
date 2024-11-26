using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Quiz
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //SqlConnection sqlConnection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\MG21024\source\repos\Quiz\Quiz\App_Data\Database2.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            //sqlConnection.Open();
            //SqlDataAdapter sqlDa = new SqlDataAdapter("select full_name from students", sqlConnection);
            //DataTable dtbl = new DataTable();
            //sqlDa.Fill(dtbl);
            //students.DataSource = dtbl;
            //students.DataBind();
            if (Session["userid"] == null)
            {
                Response.Redirect("Admin_login.aspx");
            }
            else
            {
                // code to fetch and show all the students result link from result and student table and link it with StudentTestData.aspx file..
                string connectionString = ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString;
                string sqlQuery = "select userid, test_name, test_date from result";


                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            DataTable outputTable = new DataTable();
                            outputTable.Columns.AddRange(new DataColumn[3] { new DataColumn("userid"), new DataColumn("test_name"), new DataColumn("test_date") });
                            while (reader.Read())
                            {
                                outputTable.Rows.Add(reader["userid"], reader["test_name"], reader["test_date"]);

                            }

                            students.DataSource = outputTable;
                            students.DataBind();
                        }

                    }

                }
            }

            
        }

        protected void students_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void students_SelectedIndexChanged1(object sender, EventArgs e)
        {
            //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
            //{
            //    //Determine the RowIndex of the Row whose Button was clicked.
            //    int rowIndex = Convert.ToInt32(e.CommandArgument);

            //    //Reference the GridView Row.
            //    GridViewRow row = GridView1.Rows[rowIndex];

            //    //Access Cell values.
            //    int customerId = int.Parse(row.Cells[0].Text);
            //    string name = row.Cells[1].Text;
            //    string country = row.Cells[2].Text;

            //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Customer Id: " + customerId + "\\nName: " + name + "\\nCountry: " + country + "');", true);

            //}
            //Response.Redirect("./ StudentTestData.aspx");
            //
           
        }
    }
}