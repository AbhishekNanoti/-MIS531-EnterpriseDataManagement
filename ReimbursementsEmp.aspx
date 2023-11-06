<%@ Page Title="Reimbursements" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReimbursementsEmp.aspx.cs" Inherits="TripActions.ReimbursementsEmp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
     <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-4">
            <h3>Submit a new claim</h3>
            <p>
                <a runat="server" class="btn btn-default" href="~/ClaimFormEmp">Claim Form</a>
            </p>
        </div>
        <div class="col-md-4">
            <h3>View claims</h3>
            <p>
                <a runat="server" class="btn btn-default" href="~/ViewclaimsEmp">My Claims</a>
            </p>
        </div>
    </div>
    </div>

</asp:Content>
