using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
namespace ChatRoom.Admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        ChatProperties PS = new ChatProperties();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string txtSubject = "Mail From ChatRoom...";
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage("brijesh.patil@tops-int.com", "tejas.shah@tops-int.com");
            mail.Subject = txtSubject;
            mail.Body = "http://localhost:1289/Admin/ManageLocations.aspx?UserID=" + PS.SendVerificationMail("tejas.shah@tops-int.com", 1) + "";
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
    }
}