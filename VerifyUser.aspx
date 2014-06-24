<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true"
    CodeBehind="VerifyUser.aspx.cs" Inherits="ChatRoom.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div id="cl-wrapper" class="login-container">
                <div class="middle-login">
                    <div class="block-flat">
                        <div class="header">
                            <h3 class="text-center">
                                <img class="logo-img" src="images/logo.png" alt="logo" />Chat Room</h3>
                        </div>
                        <div style="margin-bottom: 0px !important;" class="form-horizontal">
                            <div class="content">
                                <h4 class="title">
                                    <asp:Label ID="lblFirstMessage" runat="server" Text=""></asp:Label>
                                </h4>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" required placeholder="Enter Password"
                                                TextMode="Password"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                            <asp:TextBox ID="TextBox2" runat="server" class="form-control" TextMode="Password"
                                                required placeholder="Enter Confirm Password"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="foot">
                                <asp:Button ID="Button2" runat="server" Text="Proceed" class="btn btn-primary" data-dismiss="modal"
                                    OnClick="Button2_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="text-center out-links">
                        <a href="#">&copy; 2014 Chat Room</a></div>
                </div>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
             <div id="Div1" class="login-container">
                <div class="middle-login" style="margin-top: -200px; margin-left: -250px;">
                    <div class="block-flat">
                        <div class="header">
                            <h3 class="text-center">
                                <img class="logo-img" src="images/logo.png" alt="logo" />Chat Room</h3>
                        </div>
                        <div style="margin-bottom: 0px !important;" class="form-horizontal">
                            <div class="content" style="color: Black; font-family: Verdana;">
                                <div class="alert alert-success alert-white rounded">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                                        ×</button>
                                    <div class="icon">
                                        <i class="fa fa-check"></i>
                                    </div>
                                    <strong>Success!</strong><br /> Password Generated successfully!
                                </div>
                                <div class="alert alert-info alert-white rounded">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                                        ×</button>
                                    <div class="icon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <strong>Info!</strong> Please Goto <a href="Login.aspx">Login Page</a>,<br />
                                    Your EmailID will be your Username..
                                </div>
                                
                                <br />
                                <div align="right">
                                    --------------------<br />
                                    Thanks and Regards,<br />
                                    Chat Room<br />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center out-links">
                        <a href="#">&copy; 2014 Chat Room</a></div>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
