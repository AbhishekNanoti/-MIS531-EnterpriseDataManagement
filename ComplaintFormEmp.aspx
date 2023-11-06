<%@ Page Title="ComplaintForm" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ComplaintFormEmp.aspx.cs" Inherits="TripActions.ComplaintFormEmp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class =" jumbotron">
    <table align="center" class="style1" style="border: medium solid midnightblue">
    <tr>
    <td colspan="3" 
    style="border-bottom: thin solid #008080; font-weight: 700; text-align: center; height:40px; font-size:16px">
    Complaint Details</td>
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
    Type :
    </td>
    <td class="style4">
    <asp:TextBox ID="txttype" runat="server" Width="280px" PlaceHolder ="Type of Complaint"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
    ControlToValidate="txttype" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    FileDate :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtdate" runat="server" Width="280px" PlaceHolder ="dd/mm/yyyy"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
    ControlToValidate="txtdate" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    Complaint description :</td>
    <td class="style4">
    <asp:TextBox ID="txtdesc" runat="server" Width="280px" PlaceHolder ="Description"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
    ControlToValidate="txtdesc" ErrorMessage="!!" ForeColor="Red" 
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
