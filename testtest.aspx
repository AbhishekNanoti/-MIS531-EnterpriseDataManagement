<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testtest.aspx.cs" Inherits="TripActions.testtest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="COMPLAINTID" DataSourceID="SqlDataSource1" Height="50px" Width="125px" AllowPaging="True">
                <Fields>
                    <asp:BoundField DataField="COMPLAINTID" HeaderText="COMPLAINTID" ReadOnly="True" SortExpression="COMPLAINTID" />
                    <asp:BoundField DataField="TYPE" HeaderText="TYPE" SortExpression="TYPE" />
                    <asp:BoundField DataField="FILEDATE" HeaderText="FILEDATE" SortExpression="FILEDATE" />
                    <asp:BoundField DataField="RESOLVEDATE" HeaderText="RESOLVEDATE" SortExpression="RESOLVEDATE" />
                    <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                    <asp:BoundField DataField="COMPLAINTDESCRIPTION" HeaderText="COMPLAINTDESCRIPTION" SortExpression="COMPLAINTDESCRIPTION" />
                    <asp:BoundField DataField="EMPID" HeaderText="EMPID" SortExpression="EMPID" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" 
                DeleteCommand="DELETE FROM &quot;COMPLAINTS&quot; WHERE &quot;COMPLAINTID&quot; = :COMPLAINTID" 
                InsertCommand="INSERT INTO &quot;COMPLAINTS&quot; (&quot;COMPLAINTID&quot;, &quot;TYPE&quot;, &quot;FILEDATE&quot;, &quot;RESOLVEDATE&quot;, &quot;STATUS&quot;, &quot;COMPLAINTDESCRIPTION&quot;, &quot;EMPID&quot;) VALUES (:COMPLAINTID, :TYPE, :FILEDATE, :RESOLVEDATE, :STATUS, :COMPLAINTDESCRIPTION, :EMPID)" 
                ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM &quot;COMPLAINTS&quot; ORDER BY &quot;COMPLAINTID&quot; DESC" 
                UpdateCommand="UPDATE &quot;COMPLAINTS&quot; SET &quot;TYPE&quot; = :TYPE, &quot;FILEDATE&quot; = :FILEDATE, &quot;RESOLVEDATE&quot; = :RESOLVEDATE, &quot;STATUS&quot; = :STATUS, &quot;COMPLAINTDESCRIPTION&quot; = :COMPLAINTDESCRIPTION, &quot;EMPID&quot; = :EMPID WHERE &quot;COMPLAINTID&quot; = :COMPLAINTID">
                <DeleteParameters>
                    <asp:Parameter Name="COMPLAINTID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="COMPLAINTID" Type="String" />
                    <asp:Parameter Name="TYPE" Type="String" />
                    <asp:Parameter Name="FILEDATE" Type="DateTime" />
                    <asp:Parameter Name="RESOLVEDATE" Type="DateTime" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:Parameter Name="COMPLAINTDESCRIPTION" Type="String" />
                    <asp:Parameter Name="EMPID" Type="String" />
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
    </form>
</body>
</html>
