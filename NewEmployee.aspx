<%@ Page Title="New Employee" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewEmployee.aspx.cs" Inherits="TripActions.NewEmployee" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class =" jumbotron">

    <table align="center" class="style1" style="border: medium solid midnightblue">
    <tr>
    <td colspan="3" 
    style="border-bottom: thin solid #008080; font-weight: 700; text-align: center; height:40px; font-size:16px">
    New Employee</td>
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
    First Name :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtfname" runat="server" Width="280px" PlaceHolder ="First Name"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
    ControlToValidate="txtfname" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    Last Name :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtlname" runat="server" Width="280px" PlaceHolder ="Last Name"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
    ControlToValidate="txtlname" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    Address :</td>
    <td class="style4">
    <asp:TextBox ID="txtadd" runat="server" Width="280px" PlaceHolder ="Address"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
    ControlToValidate="txtadd" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    Date of joining :</td>
    <td class="style4">
    <asp:TextBox ID="txtdoj" runat="server" Width="280px" PlaceHolder ="dd/mm/yyyy"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
    ControlToValidate="txtdoj" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    Date of Birth :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtdob" runat="server" Width="280px" PlaceHolder ="dd/mm/yyyy"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
    ControlToValidate="txtdob" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    Gender :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtgen" runat="server" Width="280px" PlaceHolder ="Female/Male/Others"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
    ControlToValidate="txtgen" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    Company ID :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtcid" runat="server" Width="280px" PlaceHolder ="CC01/CC02/CC03/"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
    ControlToValidate="txtcid" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style5">
    &nbsp;</td>
    <td class="style4">
    <asp:Button ID="btnsubmit" runat="server" Text="Submit" 
    onclick="Btnsubmit_Click" />
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
    <td class="style5">
    &nbsp;</td>
    <td class="style2" colspan="2">
    <asp:Label ID="btnclick" runat="server"></asp:Label>
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
