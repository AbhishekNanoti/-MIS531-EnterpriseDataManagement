<%@ Page Title="Complaints" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ComplaintsEmp.aspx.cs" Inherits="TripActions.ComplaintsEmp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
     <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-4">
            <h3>Submit a new complaint</h3>
            <p>
                <a runat="server" class="btn btn-default" href="~/ComplaintFormEmp">Raise Complaint</a>
            </p>
        </div>
        <div class="col-md-4">
            <h3>View complaints</h3>
            <p>
                <a runat="server" class="btn btn-default" href="~/ViewComplaintsEmp">My Complaints</a>
            </p>
        </div>
    </div>
    </div>

</asp:Content>
