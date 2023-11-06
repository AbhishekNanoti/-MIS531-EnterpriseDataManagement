<%@ Page Title="Assign Cards" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="AssignCards.aspx.cs" Inherits="TripActions.AssignCards" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class =" jumbotron">

        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="EMPID,CARDNUM,STARTDATE" DataSourceID="OracleDataSource" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="EMPID" HeaderText="EMPID" ReadOnly="True" SortExpression="EMPID" />
                <asp:BoundField DataField="CARDNUM" HeaderText="CARDNUM" ReadOnly="True" SortExpression="CARDNUM" />
                <asp:BoundField DataField="STARTDATE" HeaderText="STARTDATE" ReadOnly="True" SortExpression="STARTDATE" />
                <asp:BoundField DataField="ENDDATE" HeaderText="ENDDATE" SortExpression="ENDDATE" />
                <asp:BoundField DataField="VALIDITY" HeaderText="VALIDITY" SortExpression="VALIDITY" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="OracleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" 
            DeleteCommand="DELETE FROM &quot;CARD_SUBSCRIPTIONS&quot; WHERE &quot;EMPID&quot; = :EMPID AND &quot;CARDNUM&quot; = :CARDNUM AND &quot;STARTDATE&quot; = :STARTDATE" 
            InsertCommand="INSERT INTO &quot;CARD_SUBSCRIPTIONS&quot; (&quot;EMPID&quot;, &quot;CARDNUM&quot;, &quot;STARTDATE&quot;, &quot;ENDDATE&quot;, &quot;VALIDITY&quot;) VALUES (:EMPID, :CARDNUM, :STARTDATE, :ENDDATE, :VALIDITY)" 
            ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM &quot;CARD_SUBSCRIPTIONS&quot; WHERE &quot;EMPID&quot; IN (
                                SELECT &quot;EMPLOYEEID&quot;
                                FROM &quot;CC_MANAGES&quot;
                                WHERE &quot;MANAGERID&quot; = :EMPID AND &quot;EMPLOYEEID&quot; != &quot;MANAGERID&quot;)" 
            UpdateCommand="UPDATE &quot;CARD_SUBSCRIPTIONS&quot; SET &quot;ENDDATE&quot; = :ENDDATE, &quot;VALIDITY&quot; = :VALIDITY WHERE &quot;EMPID&quot; = :EMPID AND &quot;CARDNUM&quot; = :CARDNUM AND &quot;STARTDATE&quot; = :STARTDATE">
            <DeleteParameters>
                <asp:Parameter Name="EMPID" Type="String" />
                <asp:Parameter Name="CARDNUM" Type="Decimal" />
                <asp:Parameter Name="STARTDATE" Type="DateTime" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="EMPID" Type="String" />
                <asp:Parameter Name="CARDNUM" Type="Decimal" />
                <asp:Parameter Name="STARTDATE" Type="DateTime" />
                <asp:Parameter Name="ENDDATE" Type="DateTime" />
                <asp:Parameter Name="VALIDITY" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ENDDATE" Type="DateTime" />
                <asp:Parameter Name="VALIDITY" Type="Decimal" />
                <asp:Parameter Name="EMPID" Type="String" />
                <asp:Parameter Name="CARDNUM" Type="Decimal" />
                <asp:Parameter Name="STARTDATE" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
   <h5>Can assign the employees new cards that are a part of the contract only.</h5>   
    </div>
</asp:Content>
