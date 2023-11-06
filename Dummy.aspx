<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dummy.aspx.cs" Inherits="TripActions.Dummy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                <h1>Welcome, <%=Session["empID"] %></h1>
            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="REIMBURSEMENTID" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="REIMBURSEMENTID" HeaderText="REIMBURSEMENTID" ReadOnly="True" SortExpression="REIMBURSEMENTID" />
                    <asp:BoundField DataField="EXPENSEDATE" HeaderText="EXPENSEDATE" SortExpression="EXPENSEDATE" />
                    <asp:BoundField DataField="LOCATION" HeaderText="LOCATION" SortExpression="LOCATION" />
                    <asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" SortExpression="AMOUNT" />
                    <asp:BoundField DataField="MODEOFEXPENSE" HeaderText="MODEOFEXPENSE" SortExpression="MODEOFEXPENSE" />
                    <asp:BoundField DataField="TYPEOFEXPENSEINCURRED" HeaderText="TYPEOFEXPENSEINCURRED" SortExpression="TYPEOFEXPENSEINCURRED" />
                    <asp:BoundField DataField="EMPID" HeaderText="EMPID" SortExpression="EMPID" />
                    <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>"
                DeleteCommand="DELETE FROM &quot;REIMBURSEMENTS&quot; WHERE &quot;REIMBURSEMENTID&quot; = :REIMBURSEMENTID" 
                InsertCommand="INSERT INTO &quot;REIMBURSEMENTS&quot; (&quot;REIMBURSEMENTID&quot;, &quot;EXPENSEDATE&quot;, &quot;LOCATION&quot;, &quot;AMOUNT&quot;, &quot;MODEOFEXPENSE&quot;, &quot;TYPEOFEXPENSEINCURRED&quot;, &quot;EMPID&quot;, &quot;STATUS&quot;) VALUES (:REIMBURSEMENTID, :EXPENSEDATE, :LOCATION, :AMOUNT, :MODEOFEXPENSE, :TYPEOFEXPENSEINCURRED, :EMPIDtest, :STATUS)" 
                ProviderName="Oracle.ManagedDataAccess.Client" 
                SelectCommand="SELECT * FROM &quot;REIMBURSEMENTS&quot; WHERE &quot;EMPID&quot; = :EMPIDtest ORDER BY &quot;REIMBURSEMENTID&quot; DESC" 
                UpdateCommand="UPDATE &quot;REIMBURSEMENTS&quot; SET &quot;EXPENSEDATE&quot; = :EXPENSEDATE, &quot;LOCATION&quot; = :LOCATION, &quot;AMOUNT&quot; = :AMOUNT, &quot;MODEOFEXPENSE&quot; = :MODEOFEXPENSE, &quot;TYPEOFEXPENSEINCURRED&quot; = :TYPEOFEXPENSEINCURRED, &quot;EMPID&quot; = :EMPIDtest, &quot;STATUS&quot; = :STATUS WHERE &quot;REIMBURSEMENTID&quot; = :REIMBURSEMENTID">
                <DeleteParameters>
                    <asp:Parameter Name="REIMBURSEMENTID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="REIMBURSEMENTID" Type="String" />
                    <asp:Parameter Name="EXPENSEDATE" Type="DateTime" />
                    <asp:Parameter Name="LOCATION" Type="String" />
                    <asp:Parameter Name="AMOUNT" Type="Decimal" />
                    <asp:Parameter Name="MODEOFEXPENSE" Type="String" />
                    <asp:Parameter Name="TYPEOFEXPENSEINCURRED" Type="String" />
                    <asp:Parameter Name="EMPID" Type="String" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:SessionParameter Name="EMPIDtest" SessionField="empID" Type="String" />
                </InsertParameters>
                <SelectParameters>
                <asp:SessionParameter Name="EMPIDtest" SessionField="empID" Type="String" />
            </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EXPENSEDATE" Type="DateTime" />
                    <asp:Parameter Name="LOCATION" Type="String" />
                    <asp:Parameter Name="AMOUNT" Type="Decimal" />
                    <asp:Parameter Name="MODEOFEXPENSE" Type="String" />
                    <asp:Parameter Name="TYPEOFEXPENSEINCURRED" Type="String" />
                    <asp:Parameter Name="EMPID" Type="String" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:Parameter Name="REIMBURSEMENTID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>