<%@ Page Title="ClaimForm" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClaimFormEmp.aspx.cs" Inherits="TripActions.ClaimFormEmp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class =" jumbotron">
    <table align="center" class="style1" style="border: medium solid midnightblue">
    <tr>
    <td colspan="3" 
    style="border-bottom: thin solid #008080; font-weight: 700; text-align: center; height:40px; font-size:16px">
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
    <tr>
    <td class="style6" style="text-align:center">
    Expense Date :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtdate" runat="server" Width="280px" PlaceHolder ="dd/mm/yyyy"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
    ControlToValidate="txtdate" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    Location :
    </td>
    <td class="style4">
    <asp:TextBox ID="txtloc" runat="server" Width="280px" PlaceHolder ="Enter Location"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
    ControlToValidate="txtloc" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    Amount (in $)&nbsp; :</td>
    <td class="style4">
    <asp:TextBox ID="txtamount" runat="server" Width="280px" PlaceHolder ="Expense Amount"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
    ControlToValidate="txtamount" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    Mode Of Expense :
    <td class="style4">
    <asp:DropDownList ID="ModeID" runat="server">
        <asp:ListItem Selected="True" Value="0">--Select--</asp:ListItem>
        <asp:ListItem Value="cash">Cash</asp:ListItem>
        <asp:ListItem Value="card">Personal Card</asp:ListItem>
        <asp:ListItem Value="wallet">Digital Wallets</asp:ListItem>
        <asp:ListItem Value="other">Other</asp:ListItem>
    </asp:DropDownList>
    </td>
    </td>
    <!--<td class="style4">
    <asp:TextBox ID="txtexpense" runat="server" Width="280px" PlaceHolder ="Cash/Card"></asp:TextBox>
    </td>
    <td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
    ControlToValidate="txtexpense" ErrorMessage="!!" ForeColor="Red" 
    SetFocusOnError="True"></asp:RequiredFieldValidator>
    </td>-->
    </tr>
    <tr>
    <td class="style6" style="text-align:center">
    Type Of Expense :
    </td>
    <td class="style4">
    <asp:TextBox ID="txttype" runat="server" Width="280px" PlaceHolder ="Mobile Bill/ Travel/ Leisure"></asp:TextBox>
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