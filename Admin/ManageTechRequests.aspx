<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Main.Master" AutoEventWireup="true" CodeBehind="ManageTechRequests.aspx.cs" Inherits="ChatRoom.Admin.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ReqID" onrowcommand="GridView1_RowCommand"  CssClass="MyGridTable"
        ondatabound="GridView1_DataBound">
        <Columns>
            <asp:TemplateField HeaderText="Faculty Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Eval("Fname")+" "+Eval("Lname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Location">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# bind("LocationName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Main Technology">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# bind("MainTech") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Requested Technology">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# bind("ReqTech") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false"
                        Checked='<%# bind("IsApproved") %>' />
                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CommandName="StatusF"
                        CommandArgument='<%# bind("ReqID") %>' Text='<%# bind("IsApproved") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
