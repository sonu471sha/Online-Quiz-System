using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Quiz
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] != null)

            {

                Response.Redirect("./student_home.aspx.aspx");
            }
            else
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Myconnection"].ConnectionString);

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //check userid and password from database for student login..
            SqlCommand cmd = new SqlCommand("select userid, pwd from students where userid COLLATE Latin1_General_CS_AS = @userid AND pwd COLLATE Latin1_General_CS_AS = @pwd", con);
            cmd.Parameters.AddWithValue("@userid", txt_unm.Text);
            cmd.Parameters.AddWithValue("@pwd", txt_pwd.Text); con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["userid"] = txt_unm.Text;
                Response.Redirect("./student_home.aspx");
            }

            else
            {
          
                Response.Write("<div style='color: red; font-size: 24px;'>" + "- Invalid Userid or Password!" + "</div>");
            }
            


        }

        

        protected void btn_sign_up_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Signup.aspx");
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(".Home.aspx");
        }

        
    }
}