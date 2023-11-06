<%@ Page Title="Employee Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="TripActions.Employees" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class =" jumbotron">
        
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="EMPID" DataSourceID="OracleDataSource" Height="50px" Width="125px" AllowPaging="True">
            <Fields>
                <asp:BoundField DataField="EMPID" HeaderText="EMPID" ReadOnly="True" InsertVisible="False" SortExpression="EMPID" />
                <asp:BoundField DataField="FNAME" HeaderText="FNAME" SortExpression="FNAME" />
                <asp:BoundField DataField="LNAME" HeaderText="LNAME" SortExpression="LNAME" />
                <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                <asp:BoundField DataField="DATEOFJOINING" HeaderText="DATEOFJOINING" SortExpression="DATEOFJOINING" />
                <asp:BoundField DataField="DATEOFBIRTH" HeaderText="DATEOFBIRTH" SortExpression="DATEOFBIRTH" />
                <asp:BoundField DataField="GENDER" HeaderText="GENDER" SortExpression="GENDER" />
                <asp:BoundField DataField="COMPANYID" HeaderText="COMPANYID" SortExpression="COMPANYID" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="False" />
            </Fields>
            <FooterTemplate>
                <a href="./NewEmployee" onclick="Insert_OnClick">Insert</a>
            </FooterTemplate>
        </asp:DetailsView>
        <asp:SqlDataSource ID="OracleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" 
            DeleteCommand="DELETE FROM &quot;CC_EMPLOYEES&quot; WHERE &quot;EMPID&quot; = :EMPID" 
            InsertCommand="EXEC &quot;EMPLOYEEINSERTION&quot;(:FNAME, :ADDRESS, :DATEOFJOINING, :DATEOFBIRTH, :GENDER, :COMPANYID, :LNAME, :EMPID)"            
            ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM &quot;CC_EMPLOYEES&quot; WHERE &quot;EMPID&quot; IN (
                                SELECT &quot;EMPLOYEEID&quot;
                                FROM &quot;CC_MANAGES&quot;
                                WHERE &quot;MANAGERID&quot; = :EMPID AND &quot;EMPLOYEEID&quot; != &quot;MANAGERID&quot;)
                                ORDER BY &quot;EMPID&quot; DESC" 
            UpdateCommand="UPDATE &quot;CC_EMPLOYEES&quot; SET &quot;FNAME&quot; = :FNAME, &quot;ADDRESS&quot; = :ADDRESS, &quot;DATEOFJOINING&quot; = :DATEOFJOINING, &quot;DATEOFBIRTH&quot; = :DATEOFBIRTH, &quot;GENDER&quot; = :GENDER, &quot;COMPANYID&quot; = :COMPANYID, &quot;LNAME&quot; = :LNAME WHERE &quot;EMPID&quot; = :EMPID">
            <DeleteParameters>
                <asp:Parameter Name="EMPID" Type="String" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="FNAME" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="DATEOFJOINING" Type="DateTime" />
                <asp:Parameter Name="DATEOFBIRTH" Type="DateTime" />
                <asp:Parameter Name="GENDER" Type="String" />
                <asp:Parameter Name="COMPANYID" Type="String" />
                <asp:Parameter Name="LNAME" Type="String" />
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FNAME" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="DATEOFJOINING" Type="DateTime" />
                <asp:Parameter Name="DATEOFBIRTH" Type="DateTime" />
                <asp:Parameter Name="GENDER" Type="String" />
                <asp:Parameter Name="COMPANYID" Type="String" />
                <asp:Parameter Name="LNAME" Type="String" />
                <asp:Parameter Name="EMPID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
    </div>
</asp:Content>
