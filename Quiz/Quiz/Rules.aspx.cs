using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Windows;
using System.Drawing;

namespace Quiz
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            else
            {
                Label2.BackColor = SystemColors.Control;
                Label2.BorderWidth = 2;
                Label3.BackColor = Color.DarkGray;
                Label3.BorderWidth = 2;
                Label4.BackColor = Color.BlueViolet;
                Label4.BorderWidth = 2;
                Label5.BackColor = Color.ForestGreen;
                Label5.BorderWidth = 2;
                Button1.Enabled = false;
            }

        }

    




        protected void Button1_Click(object sender, EventArgs e)
        {

            // code to open online quiz page to new window
            Session["userid"] = Session["userid"];
            //Response.Redirect("onlinequiz.aspx");
            string url = "./onlinequiz.aspx";
            ////string script = "window.open('" + url + "','_blank','resizable=yes, scrollbars=yes, taskbar= no, status=no,location=no,toolbar=no,menubar=no,width=800,height=600');";
            ////string script = "window.open('" + url + "','_blank','fullscreen= yes,resizable=no,scrollbars=yes,status=no,location=no,toolbar=no,menubar=no');";

            string script = "window.open('" + url + "','_blank','fullscreen= yes');";

            //string script = "var width = window.screen.availWidth; "+
            //                "var height = window.screen.availHeight; "+
            //                "window.open('" + url + "','_blank','width=' + width + ',height=' + height + ');";

            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "OpenWindow", script, true);

        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                Button1.Enabled = true;

            }
            else
            {
                Button1.Enabled = false;

            }
        }
    }
}