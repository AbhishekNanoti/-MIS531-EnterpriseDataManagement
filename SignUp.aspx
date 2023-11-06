<%@ Page Title="SignUp" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="TripActions.SignUp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class =" jumbotron">
    <table align="center" class="style1" style="border: medium solid midnightblue">
    <tr>
    <td colspan="3" 
    style="border-bottom: thin solid #008080; font-weight: 700; text-align: center; height:40px; font-size:16px">
    User SignUp Form</td>
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
    EmpID :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtempid" runat="server" Width="280px" PlaceHolder ="Employee ID"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
    ControlToValidate="txtempid" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    UserName :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtuname" runat="server" Width="280px" PlaceHolder ="Choose a unique UserName"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
    ControlToValidate="txtuname" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    Email :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtemail" runat="server" Width="280px" PlaceHolder ="Email Address"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
    ControlToValidate="txtemail" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
    ControlToValidate="txtemail" ErrorMessage="invalid email" ForeColor="Red" 
    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    Contact :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtcontact" runat="server" Width="280px" PlaceHolder ="xxx-xxx-xxxx"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
    ControlToValidate="txtcontact" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    Password&nbsp; :</td>
    <td class="style4">
    <asp:TextBox ID="txtpassword" runat="server" Width="280px" TextMode="Password" PlaceHolder ="Choose a strong password"></asp:TextBox>
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
    <asp:Button ID="btnregistration" runat="server" Text="SignUp" 
    onclick="Btnregistration_Click" />
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
