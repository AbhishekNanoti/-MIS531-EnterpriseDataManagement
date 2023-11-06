<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TripActions._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>EXPENSE MANAGEMENT TOOL</h1>
        <p class="lead">Your One Stop Expense Management Tool</p>
        <p><a href="https://tripactions.com/sign-up/all-in-one/autopilot?utm_medium=Paid%20Search&utm_source=bing&utm_term=tripactions.com&utm_campaign=USA%7CBing%7CSearch%7CCore%7CBrand%7CExact%7CFM-TDR%7CDR%7CCM-BecH&msclkid=2d57ab9cb9ad17dba5f0c8e16be6b12e" class="btn btn-default" style="color:midnightblue">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-4">
            <h3 style="color:white; font-size:18px">New User</h3>
            <p>
                <a runat="server" class="btn btn-default" style="color:midnightblue" href="~/SignUp">SignUp</a>
            </p>
        </div>
        <div class="col-md-4">
            <h3 style="color:white; font-size:18px">Existing User</h3>
            <p>
                <a runat="server" class="btn btn-default" style="color:midnightblue" href="~/Login">Login</a>
            </p>
        </div>
    </div>

</asp:Content>
