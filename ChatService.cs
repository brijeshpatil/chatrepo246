using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ChatRoom
{

    public class ChatService
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlDataAdapter da;
        DataTable dt;
        SqlCommand cmd;

        #region Manage_Technologies

        public DataTable GetAllTechnologies()
        {
            cmd = new SqlCommand("GetTechnologies", con);
            cmd.CommandType = CommandType.StoredProcedure;
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public void InsertNewTechnology(ChatProperties P)
        {
            cmd = new SqlCommand("InsertNewTechnology", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TName", P.TechName);
            cmd.Parameters.AddWithValue("@TEmail", P.TechEmail);
            cmd.Parameters.AddWithValue("@Active", P.IsActive);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void UpdateTechnology(ChatProperties P)
        {
            cmd = new SqlCommand("UpdateTechnology", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TName", P.TechName);
            cmd.Parameters.AddWithValue("@TEmail", P.TechEmail);
            cmd.Parameters.AddWithValue("@TechID", P.TechID);
            
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void DeleteTechology(int TechnologyID)
        {
            cmd = new SqlCommand("DeleteTechology", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TID", TechnologyID);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void ManageTechnolgies(int TechnologyID, bool TechnologyStatus)
        {
            cmd = new SqlCommand("ManageTechnolgies", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TechID", TechnologyID);
            cmd.Parameters.AddWithValue("@Active", TechnologyStatus);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        #endregion

        #region ManageLocation

        public DataTable GetAllLocation()
        {
            cmd = new SqlCommand("GetAllLocation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public void InsertNewLocation(string LocationName,bool LocationStatus)
        {
            cmd = new SqlCommand("InsertNewLocation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Lname", LocationName);
            cmd.Parameters.AddWithValue("@Active", LocationStatus);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();              
        }

        public void UpdateLocation(int LocationID, string LocationName)
        {
            cmd = new SqlCommand("UpdateLocation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@LID", LocationID);
            cmd.Parameters.AddWithValue("@LName", LocationName);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void DeleteLocation(int LocationID)
        {
            cmd = new SqlCommand("DeleteLocation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@LID", LocationID);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void ManageLocation(int LocationID, bool LocationStatus)
        {
            cmd = new SqlCommand("ManageLocation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@LID", LocationID);
            cmd.Parameters.AddWithValue("@Active", LocationStatus);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        #endregion

        #region ManageFaculty

        public bool CheckEmail(string Email)
        {
            cmd = new SqlCommand("CheckEmail", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email", Email);
            con.Open();
            bool Status =Convert.ToBoolean( cmd.ExecuteScalar());
            con.Close();
            return Status;
        }

        public void RegisterNewFaculty(ChatProperties P)
        {
            cmd = new SqlCommand("RegisterNewFaculty",con);
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FID",Guid.NewGuid());
            cmd.Parameters.AddWithValue("@Fname",P.FirstName);
            cmd.Parameters.AddWithValue("@Lname",P.LastName);
            cmd.Parameters.AddWithValue("@Gender",P.Gender);
            cmd.Parameters.AddWithValue("@DOB",P.DOB);
            cmd.Parameters.AddWithValue("@Email",P.EmailID);
            cmd.Parameters.AddWithValue("@TID",P.TechID);
            cmd.Parameters.AddWithValue("@LID",P.LocationID);
            cmd.Parameters.AddWithValue("@FImage", P.FacultyImage);
            cmd.Parameters.AddWithValue("@RegDate", DateTime.Now);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public string SendVerificationMail(string EmailID, int LocationID)
        {
            cmd = new SqlCommand("SendVerificationMail", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email", EmailID);
            cmd.Parameters.AddWithValue("@LID", LocationID);
            string data = "";
            con.Open();
            data = cmd.ExecuteScalar().ToString();
            con.Close();
            return data;
        }

        public bool IsFacultyVerified(Guid FacultyID)
        {
            cmd = new SqlCommand("IsFacultyVerified", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FID", FacultyID);
            bool IsVerified = true;
            con.Open();
            IsVerified = Convert.ToBoolean(cmd.ExecuteScalar());
            con.Close();
            return IsVerified;
        }

        public void CreateFacultyPass(Guid FacultyID, string Password)
        {
            cmd = new SqlCommand("CreateFacultyPass", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FID", FacultyID);
            cmd.Parameters.AddWithValue("@Pass", Password);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public bool FacultyLogin(string UserName, string Password)
        {
            cmd = new SqlCommand("FacultyLogin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Pass", Password);
            cmd.Parameters.AddWithValue("@UName", UserName);
            bool Status = true;
            con.Open();
            Status = Convert.ToBoolean(cmd.ExecuteScalar());
            con.Close();
            return Status;
        }

        public DataTable GetFacultyProfile(string EmailID)
        {
            cmd = new SqlCommand("GetFacultyProfile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@EmailID", EmailID);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public void ChangePassword(string EmailID, string NewPassword)
        {
            cmd = new SqlCommand("ChangePassword", con);
            cmd.Parameters.AddWithValue("@Email", EmailID);
            cmd.Parameters.AddWithValue("@Pass", NewPassword);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void UpdateFacultyProfile(ChatProperties P)
        {
            cmd = new SqlCommand("UpdateFacultyProfile",con);
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FID",P.FacultyID);
            cmd.Parameters.AddWithValue("@Fname",P.FirstName);
            cmd.Parameters.AddWithValue("@Lname",P.LastName);
            cmd.Parameters.AddWithValue("@Gender",P.Gender);
            cmd.Parameters.AddWithValue("@DOB", P.DOB);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public DataTable GetTechReqest()
        {
            cmd = new SqlCommand("GetTechReqest", con);
            cmd.CommandType = CommandType.StoredProcedure;
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public void TechReqStatus(int RequestID, bool ReqestStatus)
        {
            cmd = new SqlCommand("TechReqStatus", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ReqID", RequestID);
            cmd.Parameters.AddWithValue("@Status", ReqestStatus);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        #endregion

        #region ManageRequests

        public void SendTechReq(ChatProperties P)
        {
            cmd = new SqlCommand("SendTechReq",con);
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TechID",P.TechID);
            cmd.Parameters.AddWithValue("@FID",P.FacultyID);
            cmd.Parameters.AddWithValue("@RDate",DateTime.Now);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        #endregion

        #region ManageInterChat

        public void MakeInterChat(ChatProperties P)
        {
            cmd = new SqlCommand("MakeInterChat", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@LID", P.LocationID);
            cmd.Parameters.AddWithValue("@FID", P.FacultyID);
            cmd.Parameters.AddWithValue("@msg", P.Message);
            cmd.Parameters.AddWithValue("@CDate", DateTime.Now);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public DataTable GetAllInernalChat(ChatProperties P)
        {
            cmd = new SqlCommand("GetAllInernalChat", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@LID", P.LocationID);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        #endregion
    }
}