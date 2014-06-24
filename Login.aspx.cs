using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace ChatRoom
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        ChatProperties PS = new ChatProperties();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (PS.FacultyLogin(TextBox1.Text, TextBox2.Text))
            {
                Session["FProfile"] = PS.GetFacultyProfile(TextBox1.Text);
                Session["FEmail"] = TextBox1.Text;
                Session["FID"] = ((DataTable)Session["FProfile"]).Rows[0]["FacultyID"].ToString();
                Response.Redirect("Faculty/Home.aspx");
            }
            else
            {

            }
        }
    }
}