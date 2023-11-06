<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TripActions.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class =" jumbotron">
    <table align="center" class="style1" style="border: medium solid midnightblue">
    <tr>
    <td colspan="3" 
    style="border-bottom: thin solid #008080; font-weight: 700; text-align: center; height:40px; font-size:16px">
    User Login Form</td>
    </tr>
    <tr>
    <td class="style5">
    &nbsp;</td>
    <td class="style4">
    &nbsp;</td>
    <td>
    &nbsp;</td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    UserName :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtuname" runat="server" Width="280px" PlaceHolder ="UserName"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
    ControlToValidate="txtuname" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    Password&nbsp; :</td>
    <td class="style4">
    <asp:TextBox ID="txtpassword" runat="server" Width="280px" TextMode="Password" PlaceHolder ="Password"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
    ControlToValidate="txtpassword" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style5">
    &nbsp;</td>
    <td class="style4">
    <asp:Button ID="btnlogin" runat="server" Text="Login" 
    onclick="Btnlogin_Click" />
    </td>
    <td>
    &nbsp;</td>
    </tr>
    <tr>
    <td class="style5">
    &nbsp;</td>
    <td class="style2" colspan="2">
    <asp:Label ID="lblmsg" runat="server"></asp:Label>
    </td>
    </tr>
    <tr>
    <td colspan="3">
    &nbsp;<asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    </td>
    </tr>
    </table>
</div>
</asp:Content>
