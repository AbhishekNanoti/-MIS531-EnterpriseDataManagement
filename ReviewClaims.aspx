<%@ Page Title="Review Claims" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReviewClaims.aspx.cs" Inherits="TripActions.ReviewClaims" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class =" jumbotron">

        <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" AutoGenerateColumns="False" DataSourceID="OracleDateSource">
            <Columns>
                <asp:BoundField DataField="REIMBURSEMENTID" HeaderText="REIMBURSEMENTID" ReadOnly="True" SortExpression="REIMBURSEMENTID" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" ReadOnly="True" SortExpression="NAME" />
                <asp:BoundField DataField="EXPENSEDATE" HeaderText="EXPENSEDATE" ReadOnly="True" SortExpression="EXPENSEDATE" />
                <asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" ReadOnly="True" SortExpression="AMOUNT" />
                <asp:BoundField DataField="MODEOFEXPENSE" HeaderText="MODEOFEXPENSE" ReadOnly="True" SortExpression="MODEOFEXPENSE" />
                <asp:BoundField DataField="TYPEOFEXPENSEINCURRED" HeaderText="TYPEOFEXPENSEINCURRED" ReadOnly="True" SortExpression="TYPEOFEXPENSEINCURRED" />
                <asp:BoundField DataField="STATUS" HeaderText="STATUS" ReadOnly="True" SortExpression="STATUS" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button Text="Approve" runat="server" CommandName="ApproveClaim" CommandArgument="<%# Container.DataItemIndex %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button Text="Reject" runat="server" CommandName="RejectClaim" CommandArgument="<%# Container.DataItemIndex %>" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                 <div align="center">No pending claims to review</div>
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="OracleDateSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="SELECT reimbursementid, (fname || ' ' || lname) as name, expensedate, amount, modeofexpense, typeofexpenseincurred, status
FROM reimbursements r
    JOIN cc_employees e ON r.empid = e.empid
WHERE status not in ( 'Approved', 'Declined', 'Auto Approved')
AND r.empid IN (
    SELECT employeeID
    FROM CC_MANAGES
    WHERE managerID = :EMPID AND employeeID != managerID
)
order by expensedate">
        <SelectParameters>
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
