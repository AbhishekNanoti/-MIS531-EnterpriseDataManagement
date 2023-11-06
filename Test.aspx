<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewClaims.aspx.cs" Inherits="TripActions.ViewClaims" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class =" jumbotron">
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="COMPLAINTID" DataSourceID="SqlDataSource" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="COMPLAINTID" HeaderText="COMPLAINTID" ReadOnly="True" InsertVisible="False" SortExpression="COMPLAINTID" />
                <asp:BoundField DataField="TYPE" HeaderText="TYPE" SortExpression="TYPE" />
                <asp:BoundField DataField="FILEDATE" HeaderText="FILEDATE" ReadOnly="True" SortExpression="FILEDATE" />
                <asp:BoundField DataField="RESOLVEDATE" HeaderText="RESOLVEDATE" ReadOnly="True" InsertVisible="False" SortExpression="RESOLVEDATE" />
                <asp:BoundField DataField="STATUS" HeaderText="STATUS" ReadOnly="True" InsertVisible="False" SortExpression="STATUS" />
                <asp:BoundField DataField="COMPLAINTDESCRIPTION" HeaderText="COMPLAINTDESCRIPTION" SortExpression="COMPLAINTDESCRIPTION" />
                <asp:BoundField DataField="EMPID" HeaderText="EMPID" ReadOnly="True" InsertVisible="False" SortExpression="EMPID" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" 
            DeleteCommand="DELETE FROM &quot;COMPLAINTS&quot; WHERE &quot;COMPLAINTID&quot; = :COMPLAINTID" 
            InsertCommand="INSERT INTO &quot;COMPLAINTS&quot; (&quot;TYPE&quot;, &quot;FILEDATE&quot;, &quot;STATUS&quot;, &quot;COMPLAINTDESCRIPTION&quot;, &quot;EMPID&quot;) VALUES (:TYPE, :FILEDATE, 'Open', :COMPLAINTDESCRIPTION, :EMPID)" 
            ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM &quot;COMPLAINTS&quot; WHERE &quot;EMPID&quot; = :EMPID ORDER BY &quot;COMPLAINTID&quot; DESC" 
            UpdateCommand="UPDATE &quot;COMPLAINTS&quot; SET &quot;TYPE&quot; = :TYPE, &quot;COMPLAINTDESCRIPTION&quot; = :COMPLAINTDESCRIPTION WHERE &quot;COMPLAINTID&quot; = :COMPLAINTID AND &quot;STATUS&quot; != 'Resolved'">
            <DeleteParameters>
                <asp:Parameter Name="COMPLAINTID" Type="String" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="COMPLAINTID" Type="String" />
                <asp:Parameter Name="TYPE" Type="String" />
                <asp:Parameter Name="FILEDATE" Type="DateTime" />
                <asp:Parameter Name="RESOLVEDATE" Type="DateTime" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="COMPLAINTDESCRIPTION" Type="String" />
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TYPE" Type="String" />
                <asp:Parameter Name="FILEDATE" Type="DateTime" />
                <asp:Parameter Name="RESOLVEDATE" Type="DateTime" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="COMPLAINTDESCRIPTION" Type="String" />
                <asp:Parameter Name="EMPID" Type="String" />
                <asp:Parameter Name="COMPLAINTID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
