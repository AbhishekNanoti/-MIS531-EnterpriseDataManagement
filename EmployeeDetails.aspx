<%@ Page Title="Employees Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="TripActions.EmployeeDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
     <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-4">
            <h3>Add new employee</h3>
            <p>
                <a runat="server" class="btn btn-default" href="~/NewEmployee">Insert</a>
            </p>
        </div>
        <div class="col-md-4">
            <h3>View employee details</h3>
            <p>
                <a runat="server" class="btn btn-default" href="~/Employees">View</a>
            </p>
        </div>
    </div>
    </div>

</asp:Content>
