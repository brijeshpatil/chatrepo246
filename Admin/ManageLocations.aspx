<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Main.Master" AutoEventWireup="true"
    CodeBehind="ManageLocations.aspx.cs" Inherits="ChatRoom.Admin.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridLocation" runat="server" AutoGenerateColumns="False" DataKeyNames="LocationID"
        OnDataBound="GridLocation_DataBound" OnRowCancelingEdit="GridLocation_RowCancelingEdit"
        OnRowCommand="GridLocation_RowCommand" OnRowDeleting="GridLocation_RowDeleting"
        OnRowEditing="GridLocation_RowEditing" OnRowUpdating="GridLocation_RowUpdating"
        CssClass="MyGridTable" ShowHeaderWhenEmpty="True">
        <Columns>
            <asp:TemplateField HeaderText="LocationID">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# bind("LocationID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# bind("LocationID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# bind("LocationName") %>'></asp:TextBox>
                </EditItemTemplate>
                <HeaderTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" PlaceHolder="Location Name"></asp:TextBox>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# bind("LocationName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    &nbsp;
                </EditItemTemplate>
                <HeaderTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" Text="IsActive?" />
                    &nbsp;<asp:Button ID="Button1" runat="server" CommandName="Add" Text="Add" CssClass="btn btn-danger" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# bind("IsActive") %>' Enabled="False" />
                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# bind("LocationID") %>'
                        Text='<%# bind("IsActive") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <EmptyDataTemplate>
            <h2>
                No Location Available to Display...</h2>
        </EmptyDataTemplate>
    </asp:GridView>
</asp:Content>
