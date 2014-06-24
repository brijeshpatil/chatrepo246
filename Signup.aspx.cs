using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace ChatRoom
{
    public partial class WebForm4 : System.Web.UI.Page
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
            drpTEchnology.DataSource = PS.GetAllTechnologies();
            drpTEchnology.DataTextField = "TechName";
            drpTEchnology.DataValueField = "TechID";
            drpTEchnology.DataBind();
            ListItem li = new ListItem();
            li.Value = "0";
            li.Text = "Please Select Your Technology";
            drpTEchnology.Items.Insert(0, li);
        }
        static string vrPersonalInfo = "";
        protected void btnPersonal_Click(object sender, EventArgs e)
        {
            vrPersonalInfo = txtfname.Text + "," + txtlname.Text + "," + RdoGender.SelectedItem.Value + "," + txtdob.Text;
            MultiView1.ActiveViewIndex = 1;
        }

        
        protected void btnInformation_Click(object sender, EventArgs e)
        {
            string[] arPersonalInfo = (string[])vrPersonalInfo.Split(',');
            PS.FirstName = arPersonalInfo[0];
            PS.LastName = arPersonalInfo[1];
            PS.Gender = arPersonalInfo[2];
            PS.DOB = Convert.ToDateTime(arPersonalInfo[3]);
            PS.EmailID = txtEmailID.Text;
            PS.TechID = Convert.ToInt16(drpTEchnology.SelectedItem.Value);
            PS.LocationID = Convert.ToInt16(drpLocation.SelectedItem.Value);
            if (PS.Gender.ToLower()== "male")
            {
                PS.FacultyImage = "user1.png";
            }
            else
            {
                PS.FacultyImage = "femaleuserbig.png";
            }
            
           // fpImage.SaveAs(Server.MapPath(PS.FacultyImage));
            PS.RegisterNewFaculty(PS);

            SendMail();
            MultiView1.ActiveViewIndex = 2;
        }

        private void SendMail()
        {
            string txtSubject = "Mail From ChatRoom...";
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage("brijesh.patil@tops-int.com", txtEmailID.Text);
            mail.Subject = txtSubject;
            mail.Body = "<a href='chatroom-5" + "." + "apphb" + ".com" + "/VerifyUser.aspx?UserID=" + PS.SendVerificationMail(PS.EmailID, PS.LocationID) + "'>Click here to verify your account..</a>";
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

        protected void EmailID_TextChanged(object sender, EventArgs e)
        {
            if (PS.CheckEmail(txtEmailID.Text))
            {
                btnInformation.Enabled = false;
                txtEmailID.BackColor = System.Drawing.Color.Gray;
                txtEmailID.ForeColor = System.Drawing.Color.White;
                txtEmailID.Focus();
                txtEmailID.ToolTip = "EmailID Already Exists..!";

            }
            else
            {
                btnInformation.Enabled= true;
                drpTEchnology.Focus();
                txtEmailID.BackColor = System.Drawing.Color.White;
                txtEmailID.ForeColor = System.Drawing.Color.Black;
                txtEmailID.ToolTip = "EmailID Alailable..!";
            }
        }
    }
}