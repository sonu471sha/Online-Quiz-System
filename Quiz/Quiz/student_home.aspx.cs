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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)

            {
                //Response.Redirect("./Rules.aspx", true);
                //Response.Redirect("Website.Master");
                Response.Redirect("Login.aspx");
            }
            else
            {
                
                if (!IsPostBack)
                {
                    // code to fill saved student details to table

                    string usid = (string)Session["userid"];
                    Label1.Text = usid;
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString);
                    string query = "SELECT full_name, dob, gender, contact_no, email_id FROM students where userid=@us_id";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@us_id", usid);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        TextBox2.Text = dr[0].ToString();
                        TextBox3.Text = dr[1].ToString();
                        DropDownList1.SelectedValue = dr[2].ToString();
                        TextBox5.Text = dr[3].ToString();
                        TextBox6.Text = dr[4].ToString();
                    }
                    dr.Close();
                    con.Close();
                }



            }
        }


        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // code to check if student has given the same test before
            string ConnectionStr = (ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString);
            string use_id = Session["userid"].ToString();
            string query1 = "SELECT test_name FROM result where userid=@use_id";

            string filePath = Server.MapPath("./Text_file/TextFile1.txt");
            string tes_nam;
            using (StreamReader reader = new StreamReader(filePath))
            {
                reader.ReadLine();
                tes_nam = reader.ReadLine();

            }
            bool tes_to_srt = true;
            using (SqlConnection connection = new SqlConnection(ConnectionStr))
            {
                SqlCommand command = new SqlCommand(query1, connection);
                connection.Open();

                command.Parameters.AddWithValue("@use_id", use_id);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    string columnValue = reader.GetString(0);
                    if (columnValue == tes_nam)
                    {
                        tes_to_srt = false;

                    }
                }
                reader.Close();


            }
            if (!tes_to_srt)
            {


                Label2.Text = "you have already given the text with name: " + tes_nam;



            }
            else
            {
                Session["userid"] = Session["userid"];
                Response.Redirect("Rules.aspx");
            }
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // code to enable edit
            TextBox2.Enabled = true;
            TextBox3.Enabled = true;
            DropDownList1.Enabled = true;
            TextBox5.Enabled = true;
            TextBox6.Enabled = true;
            this.Button3.Visible = true;
            this.Button1.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            // code to update items to student table..
            string usid = (string)Session["userid"];
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString);
            string que= "UPDATE students SET full_name='" + TextBox2.Text + "',dob='" + TextBox3.Text + "',gender='" + DropDownList1.Text + "',contact_no='" + TextBox5.Text + "',email_id='" + TextBox6.Text + "' WHERE userid='" + Session["userid"].ToString() + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(que, con);
            //cmd.Parameters.AddWithValue("@us_id", usid);
            
            cmd.ExecuteNonQuery();
            Response.Write("<div style='color: green; font-size: 24px;'>" + "- Updated Successfully!" + "</div>");

            con.Close();
            this.Button3.Visible = false;
            this.Button1.Visible = true;
            TextBox2.Enabled = false;
            TextBox3.Enabled = false;
            DropDownList1.Enabled = false;
            TextBox5.Enabled = false;
            TextBox6.Enabled = false;

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}