<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TripActions.Profile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class =" jumbotron">
    <table align="center" class="style1" style="border: thin solid #008080">
    <tr>
    <td colspan="3" 
    style="border-bottom: thin solid #008080; font-weight: 700; text-align: center;">
    Reimbursement Claim Form</td>
    </tr>
    <tr>
    <td class="style5">
    &nbsp;</td>
    <td class="style4">
    &nbsp;</td>
    <td>
    &nbsp;</td>
    </tr>
    <!--<tr>
    <td class="style6">
    EmpID :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtempid" runat="server" Width="120px"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
    ControlToValidate="txtempid" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>-->
    <tr>
    <td class="style6">
    Expense Date :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtdate" runat="server" Width="120px"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
    ControlToValidate="txtdate" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6">
    Location :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtloc" runat="server" Width="120px"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
    ControlToValidate="txtloc" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6">
    Amount (in $)&nbsp; :</td>
    <td class="style4">
    <asp:TextBox ID="txtamount" runat="server" Width="120px"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
    ControlToValidate="txtamount" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6">
    Mode Of Expense :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtexpense" runat="server" Width="120px"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
    ControlToValidate="txtexpense" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6">
    Type Of Expense :
    </td>
    <td class="style4">
    <asp:TextBox ID="txttype" runat="server" Width="120px"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
    ControlToValidate="txttype" ErrorMessage="!!" ForeColor="Red" 
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
    <td colspan="3">
    &nbsp;<asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    </td>
    </tr>
    </table>
    </div>
</asp:Content>
