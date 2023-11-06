<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TripActions.Home" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <div class="jumbotron">
        <h1>Welcome, <%=Session["empName"] %></h1>

        <h2>Your one stop expense management tool</h2>
                <h3>No spreadsheets or number crunching</h3>
                <h4>Custom policy builder gives you total flexibility and control</h4>
                <h4>Interactive dashboards to make data-driven decisions</h4>
                <h4>Automate reconciliation and save countless review hours</h4> 
        </div>

</asp:Content>
