<%@ Page Title="Reimbursements" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reimbursements.aspx.cs" Inherits="TripActions.Reimbursements" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
     <div class="row">
        <div class="col-md-1">
        </div>
        <div class="col-md-4">
            <h3>Submit a new claim</h3>
            <p>
                <a runat="server" class="btn btn-default" href="~/ClaimForm">Claim Form</a>
            </p>
        </div>
        <div class="col-md-4">
            <h3>View claims</h3>
            <p>
                <a runat="server" class="btn btn-default" href="~/ViewClaims">My Claims</a>
            </p>
        </div>
        <div class="col-md-3">
            <h3>Review claims</h3>
            <p>
                <a runat="server" class="btn btn-default" href="~/ReviewClaims">Review Claims</a>
            </p>
        </div>
    </div>
    </div>

</asp:Content>
