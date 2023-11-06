<%@ Page Title="Complaints" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Complaints.aspx.cs" Inherits="TripActions.Complaints" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
     <div class="row">
        <div class="col-md-1">
        </div>
        <div class="col-md-4">
            <h3>Submit a new complaint</h3>
            <p>
                <a runat="server" class="btn btn-default" href="~/ComplaintForm">Raise Complaint</a>
            </p>
        </div>
        <div class="col-md-4">
            <h3>View complaints</h3>
            <p>
                <a runat="server" class="btn btn-default" href="~/ViewComplaints">My Complaints</a>
            </p>
        </div>
        <div class="col-md-3">
            <h3>Review complaints</h3>
            <p>
                <a runat="server" class="btn btn-default" href="~/TopComplaints">Priority Complaints</a>
            </p>
        </div>
    </div>
    </div>

</asp:Content>
