<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/BlankMaster.Master" AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs" Inherits="ChatRoom.Faculty.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="cl-wrapper" class="login-container">
        <div class="middle-login">
            <div class="block-flat">
                <div class="header">
                    <h3 class="text-center">
                        <img class="logo-img" src="../images/logo.png" alt="logo" />Chat Room</h3>
                </div>
                <div style="margin-bottom: 0px !important;" class="form-horizontal">
                    <div class="content">
                        <h4 class="title">
                            <asp:Label ID="lblError" runat="server" Text="Change Password"></asp:Label>
                            </h4>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <asp:TextBox ID="txtUserName" runat="server" class="form-control" required 
                                        placeholder="Your UserName" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <asp:TextBox ID="txtOPass" runat="server" class="form-control" required 
                                        placeholder="Enter Old Password" AutoPostBack="True" 
                                        ontextchanged="txtOPass_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <asp:TextBox ID="txtNPass" runat="server" class="form-control" TextMode="Password"
                                        required placeholder="Enter New Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <asp:TextBox ID="txtCPass" runat="server" class="form-control" TextMode="Password"
                                        required placeholder="Enter Confirm Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="foot">
                        <asp:Button ID="Button2" runat="server" Text="Change Password" class="btn btn-primary"
                            data-dismiss="modal" onclick="Button2_Click" />
                        <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-default" NavigateUrl="~/Faculty/ManageProfile.aspx">Cancel</asp:HyperLink>
                    </div>
                </div>
            </div>
            <div class="text-center out-links">
                <a href="#">&copy; 2014 Chat Room</a></div>
        </div>
    </div>
</asp:Content>
