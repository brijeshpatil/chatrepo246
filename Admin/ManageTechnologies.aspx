<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Main.Master" AutoEventWireup="true"
    CodeBehind="ManageTechnologies.aspx.cs" Inherits="ChatRoom.Admin.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridTech" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" CssClass="MyGridTable"
        DataKeyNames="TechID" OnRowCommand="GridTech_RowCommand" OnRowCancelingEdit="GridTech_RowCancelingEdit"
        OnRowDeleting="GridTech_RowDeleting" OnRowEditing="GridTech_RowEditing" 
        OnRowUpdating="GridTech_RowUpdating" ondatabound="GridTech_DataBound">
        <Columns>
            <asp:TemplateField HeaderText="Technology ID">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# bind("TechID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# bind("TechID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Technology">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# bind("TechName") %>'></asp:TextBox>
                </EditItemTemplate>
                <HeaderTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" PlaceHolder="Technology"></asp:TextBox>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# bind("TechName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Technology Group">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# bind("TechEmail") %>'></asp:TextBox>
                </EditItemTemplate>
                <HeaderTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" PlaceHolder="Group Email"></asp:TextBox>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# bind("TechEmail") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" Text="IsActive?" />
                    <asp:Button ID="Button1" runat="server" CommandName="Add" Text="Add" CssClass="MyBtn" />
                </HeaderTemplate>
                <EditItemTemplate>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false" Checked='<%# bind("IsActive") %>' />
                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# bind("TechID") %>'
                        Text='<%# bind("IsActive") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <EmptyDataTemplate>
            <center>
                <h2>
                    No Technologies to Display..</h2>
            </center>
        </EmptyDataTemplate>
    </asp:GridView>
</asp:Content>
