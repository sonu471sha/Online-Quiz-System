using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Quiz
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] != null)

            {
                
                Response.Redirect("Admin_home.aspx");
            }
            else
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString);

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select userid, pwd from admin where userid COLLATE Latin1_General_CS_AS = @userid AND pwd COLLATE Latin1_General_CS_AS = @pwd", con);
            cmd.Parameters.AddWithValue("@userid", txt_unm.Text);
            cmd.Parameters.AddWithValue("@pwd", txt_pwd.Text);
            bool chec = false;
            con.Open();

            // To check if userid and password are valid or not
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                chec = true;
            }
            dr.Close();


            if (chec)
            {
                // To check if System is being used by some admin or not?
                string us_id = txt_unm.Text;
                SqlCommand cmd2 = new SqlCommand("select system_taken from admin", con);
                SqlDataReader reader = cmd2.ExecuteReader();
                bool allValuesSame = true;
                object previousValue = null;

                while (reader.Read())
                {
                    object currentValue = reader.GetValue(0);

                    if (previousValue != null && !previousValue.Equals(currentValue))
                    {
                        allValuesSame = false;
                        break;
                    }
                    previousValue = currentValue;
                }
                reader.Close();

                SqlCommand cmd4 = new SqlCommand("select system_taken from admin WHERE userid = @userid", con);
                cmd4.Parameters.AddWithValue("@userid", us_id);
                SqlDataReader reader2 = cmd4.ExecuteReader();
                bool systkn = false;


                if (reader2.Read())
                {
                    if (reader2.GetString(0) == "yes")
                    {
                        systkn = true;
                    }
                }
                reader2.Close();


                if (allValuesSame || systkn)
                {
                    //To update system is used by some admin
                    SqlCommand cmd3 = new SqlCommand("UPDATE admin SET system_taken = @y WHERE userid=@userid", con);
                    cmd3.Parameters.AddWithValue("@y", "yes");
                    cmd3.Parameters.AddWithValue("@userid", us_id);
                    cmd3.ExecuteNonQuery();
                    Session["userid"] = txt_unm.Text;
                    Response.Redirect("Admin_home.aspx");
                }
                else
                {


                    Response.Write("<div style='color: red; font-size: 24px;'>" + "- System is currently in use by some other admin!" + "</div>");
                }
            }

            else
            {
                Response.Write("<div style='color: red; font-size: 24px;'>" + "- Invalid Userid or Password!" + "</div>");

            }
            con.Close();


        }

    }
}   