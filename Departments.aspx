<%@ Page Title="Department Details" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Departments.aspx.cs" Inherits="TripActions.Departments" %>

<%@ Register assembly="Devart.Data.Oracle.Web, Version=10.0.0.0, Culture=neutral, PublicKeyToken=09af7300eec23701" namespace="Devart.Common.Web" tagprefix="cc1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class =" jumbotron">

        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="DEPTID" DataSourceID="OracleDataSource" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="DEPTID" HeaderText="DEPTID" ReadOnly="True" InsertVisible="false" SortExpression="DEPTID" />
                <asp:BoundField DataField="EMPCOUNT" HeaderText="EMPCOUNT" ReadOnly="True" InsertVisible="false" SortExpression="EMPCOUNT" />
                <asp:BoundField DataField="TOTALEXPENSEINCURRED" HeaderText="TOTALEXPENSEINCURRED" ReadOnly="True" InsertVisible="false" SortExpression="TOTALEXPENSEINCURRED" />
                <asp:BoundField DataField="DEPTNAME" HeaderText="DEPTNAME" SortExpression="DEPTNAME" />
                <asp:BoundField DataField="COMPANYID" HeaderText="COMPANYID" SortExpression="COMPANYID" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <cc1:DbSqlDataSource ID="OracleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" 
            DeleteCommand="DELETE FROM &quot;CC_DEPARTMENTS&quot; WHERE &quot;DEPTID&quot; = :DEPTID" 
            InsertCommand="INSERT INTO &quot;CC_DEPARTMENTS&quot; (&quot;DEPTID&quot;, &quot;EMPCOUNT&quot;, &quot;TOTALEXPENSEINCURRED&quot;, &quot;DEPTNAME&quot;, &quot;COMPANYID&quot;) VALUES (:DEPTID, :EMPCOUNT, :TOTALEXPENSEINCURRED, :DEPTNAME, :COMPANYID)" 
            ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM &quot;CC_DEPARTMENTS&quot; ORDER BY &quot;DEPTID&quot; DESC" 
            UpdateCommand="UPDATE &quot;CC_DEPARTMENTS&quot; SET &quot;EMPCOUNT&quot; = :EMPCOUNT, &quot;TOTALEXPENSEINCURRED&quot; = :TOTALEXPENSEINCURRED, &quot;DEPTNAME&quot; = :DEPTNAME, &quot;COMPANYID&quot; = :COMPANYID WHERE &quot;DEPTID&quot; = :DEPTID">
            <DeleteParameters>
                <asp:Parameter Name="Original_DEPTID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DEPTID" Type="String" />
                <asp:Parameter Name="EMPCOUNT" Type="Decimal" />
                <asp:Parameter Name="TOTALEXPENSEINCURRED" Type="Decimal" />
                <asp:Parameter Name="DEPTNAME" Type="String" />
                <asp:Parameter Name="COMPANYID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="EMPCOUNT" Type="Decimal" />
                <asp:Parameter Name="TOTALEXPENSEINCURRED" Type="Decimal" />
                <asp:Parameter Name="DEPTNAME" Type="String" />
                <asp:Parameter Name="COMPANYID" Type="String" />
                <asp:Parameter Name="Original_DEPTID" Type="String" />
            </UpdateParameters>
        </cc1:DbSqlDataSource>

    </div>
</asp:Content>

