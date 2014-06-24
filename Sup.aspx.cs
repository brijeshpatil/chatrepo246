using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace ChatRoom
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        ChatProperties PS = new ChatProperties();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                FillTEchnologies();
                FIllLocation();
            }
        }

        private void FIllLocation()
        {
            drpLocation.DataSource = PS.GetAllLocation();
            drpLocation.DataTextField = "LocationName";
            drpLocation.DataValueField = "LocationID";
            drpLocation.DataBind();
            ListItem li = new ListItem();
            li.Value = "0";
            li.Text = "Please Select Your Location";
            drpLocation.Items.Insert(0, li);
        }

        private void FillTEchnologies()
        {
            drpTechnology.DataSource = PS.GetAllTechnologies();
            drpTechnology.DataTextField = "TechName";
            drpTechnology.DataValueField = "TechID";
            drpTechnology.DataBind();
            ListItem li = new ListItem();
            li.Value = "0";
            li.Text = "Please Select Your Technology";
            drpTechnology.Items.Insert(0, li);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            PS.FirstName = txtfname.Text;
            PS.LastName = txtlname.Text;
            PS.Gender = rdogender.SelectedItem.Text;
            PS.DOB = Convert.ToDateTime(txtdob.Text);
            PS.EmailID = txtEmail.Text;
            PS.TechID = Convert.ToInt16(drpTechnology.SelectedItem.Value);
            PS.LocationID = Convert.ToInt16(drpLocation.SelectedItem.Value);
            PS.FacultyImage = "FacultyImages/" + fpImage.PostedFile.FileName;
            fpImage.SaveAs(Server.MapPath(PS.FacultyImage));
            PS.RegisterNewFaculty(PS);
            //PS.SendVerificationMail(PS.EmailID, PS.LocationID);
            SendMail();
            MultiView1.ActiveViewIndex = 1;
        }

        private void SendMail()
        {
            string txtSubject = "Mail From ChatRoom...";
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage("brijesh.patil@tops-int.com", txtEmail.Text);
            mail.Subject = txtSubject;
            mail.Body = "<a href='chatroom-5" + "." + "apphb" +".com"+ "/VerifyUser.aspx?UserID=" + PS.SendVerificationMail(PS.EmailID, PS.LocationID) + "'>Click here to verify your account..</a>";
            mail.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential("brijesh.patil@tops-int.com", "bj@29886397");
            client.Port = 587; // Gmail works on this port
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true; //Gmail works on Server Secured Layer
            try
            {
                client.Send(mail);
            }
            catch (Exception error)
            {
                throw error;
            }

        }

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            if (PS.CheckEmail(txtEmail.Text))
            {
                Button1.Visible= false;
                txtEmail.BackColor = System.Drawing.Color.Wheat;
                txtEmail.ToolTip = "EmailID Already Exists..!";
                
            }
            else
            {
                Button1.Visible = true;
                txtEmail.BackColor = System.Drawing.Color. LightSteelBlue;
                txtEmail.ToolTip = "EmailID Alailable..!";
            }
        }
    }
}