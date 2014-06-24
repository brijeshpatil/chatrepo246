using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChatRoom
{
    public class ChatProperties : ChatService
    {
        #region Common_Properties

        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
        public bool IsApprove { get; set; }
             

        #endregion

        #region TechnologiesTable

        public int TechID { get; set; }
        public string TechName { get; set; }
        public string TechEmail { get; set; }

        #endregion

        #region LocationTable

        public int LocationID { get; set; }
        public string LocationName { get; set; }

        #endregion

        #region FacutlyTable

        public Guid FacultyID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public string EmailID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public bool IsVerified { get; set; }
        public string FacultyImage { get; set; }
        public DateTime RegDate { get; set; }
        public DateTime DOB { get; set; }

        #endregion

        #region TechReqTbl

        public DateTime ReqDate { get; set; }
        public int ReqID { get; set; }
        #endregion

        #region InterChat

        public int IChatID { get; set; }
        public DateTime ChatDate { get; set; }
        public string Message { get; set; }

        #endregion

    }
}