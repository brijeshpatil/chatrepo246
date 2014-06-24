using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace ChatRoom.Faculty
{
    public partial class ManageProfile : System.Web.UI.Page
    {
        ChatProperties PS = new ChatProperties();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FID"] != null)
            {
                if (!IsPostBack)
                {
                    FillFacultyProfile();
                    FillTechnologies();
                }
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }
        }

        public void FillFacultyProfile()
        {
            FormView1.DataSource = PS.GetFacultyProfile(Session["FEmail"].ToString());
            FormView1.DataBind();
        }

        protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            string Gender = "";
            string Technolgoy = "";
            string Location = "";

            if (FormView1.CurrentMode == FormViewMode.ReadOnly)
            {
                Gender = ((Label)FormView1.FindControl("Label5")).Text;
                Technolgoy = ((Label)FormView1.FindControl("Label3")).Text;
                Location = ((Label)FormView1.FindControl("Label6")).Text;
            }

            FormView1.ChangeMode(e.NewMode);
            FillFacultyProfile();

            if (FormView1.CurrentMode == FormViewMode.Edit)
            {
                RadioButtonList rdoGender = (RadioButtonList)FormView1.FindControl("RadioButtonList1");
                foreach (ListItem li in rdoGender.Items)
                {
                    if (li.Text == Gender)
                    {
                        li.Selected = true;
                    }
                }

                //DropDownList drpTech = (DropDownList)FormView1.FindControl("DropDownList2");
                //drpTech.DataSource = PS.GetAllTechnologies();
                //drpTech.DataTextField = "TechName";
                //drpTech.DataValueField = "TechID";
                //drpTech.DataBind();

                //foreach (ListItem li in drpTech.Items)
                //{
                //    if (li.Text == Technolgoy)
                //    {
                //        li.Selected = true;
                //    }
                //}

                //DropDownList drpLocation = (DropDownList)FormView1.FindControl("DropDownList1");
                //drpLocation.DataSource = PS.GetAllLocation();
                //drpLocation.DataTextField = "LocationName";
                //drpLocation.DataValueField = "LocationID";
                //drpLocation.DataBind();

                //foreach (ListItem li in drpLocation.Items)
                //{
                //    if (li.Text == Location)
                //    {
                //        li.Selected = true;
                //    }
                //}

            }
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {

        }

        protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "AddTech")
            {
                //ModalPopupExtender1.Show();
                DropDownList drpTechnology = (DropDownList)FormView1.FindControl("drpTechnology");
                drpTechnology.Visible = true;
                Button BtnAdd = (Button)FormView1.FindControl("Button3");
                BtnAdd.Visible = true;
                //Response.Write("Called");
            }

            if (e.CommandName == "AddNewTech")
            {
                Button BtnAdd = (Button)FormView1.FindControl("Button3");
                DropDownList drpTechnology = (DropDownList)FormView1.FindControl("drpTechnology");
                PS.TechID = Convert.ToInt16(drpTechnology.SelectedItem.Value);
                PS.FacultyID = Guid.Parse(Session["FID"].ToString());
                PS.SendTechReq(PS);
                BtnAdd.Visible = false;
                drpTechnology.Visible = false;
                Label Label3 = (Label)FormView1.FindControl("Label3");
                Label3.Text += ", Request sent for "+drpTechnology.SelectedItem.Text+" Technology.!";
            }
        }

        private void FillTechnologies()
        {
            DropDownList drpTechnology = (DropDownList)FormView1.FindControl("drpTechnology");
            Label lblTech = (Label)FormView1.FindControl("Label3");


            DataTable dt = new DataTable();
            dt = PS.GetAllTechnologies();
            int i = 0;
            foreach (DataRow li123 in dt.Rows)
            {
                if (li123["TechName"].ToString() == lblTech.Text)
                {
                    break;
                }
                i++;
            }
            dt.Rows[i].Delete();
            drpTechnology.DataSource = dt;
            drpTechnology.DataTextField = "TechName";
            drpTechnology.DataValueField = "TechID";
            drpTechnology.DataBind();
            Response.Write(i);

            ListItem li = new ListItem();
            li.Text = "Select Your Optional Technology";
            li.Value = "0";
            drpTechnology.Items.Insert(0, li);
        }


    }
}