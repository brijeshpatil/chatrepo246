using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace ChatRoom.Faculty
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        ChatProperties PS = new ChatProperties();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FID"] != null)
            {
                if (!IsPostBack)
                {
                    txtUserName.Text = ((DataTable)Session["FProfile"]).Rows[0]["EmailID"].ToString();
                }
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }
        }

        protected void txtOPass_TextChanged(object sender, EventArgs e)
        {
            if (txtOPass.Text == ((DataTable)Session["FProfile"]).Rows[0]["Password"].ToString())
            {
                txtNPass.ReadOnly = false;
                txtCPass.ReadOnly = false;
                txtNPass.Focus();
                txtOPass.ReadOnly = true;
                lblError.Text = "Change Password";
            }
            else
            {
                lblError.Text = "Please Enter Valid Old Password...";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (txtNPass.Text == txtCPass.Text)
            {
                lblError.Text = "Change Password";
                PS.ChangePassword(txtUserName.Text, txtCPass.Text);
                txtCPass.Text = "";
                txtNPass.Text = "";
                lblError.Text = "Password Change..";
            }
            else
            {
                lblError.Text = "Password Not Matched....";
                txtNPass.Focus();
            }
        }
    }
}