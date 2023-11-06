<%@ Page Title="Priority Complaints" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="TopComplaints.aspx.cs" Inherits="TripActions.TopComplaints" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <div>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="MIS531DataSource">
                <ItemTemplate>
                    TYPE:
                    <asp:Label ID="TYPELabel" runat="server" Text='<%# Eval("TYPE") %>' />
                    <br />
                    Total Complaints:
                    <asp:Label ID="Total_ComplaintsLabel" runat="server" Text='<%# Eval("[Total Complaints]") %>' />
                    <br />
                    Open complaints:
                    <asp:Label ID="Open_complaintsLabel" runat="server" Text='<%# Eval("[Open complaints]") %>' />
                    <br />
                    In progress complaints:
                    <asp:Label ID="In_progress_complaintsLabel" runat="server" Text='<%# Eval("[In progress complaints]") %>' />
                    <br />
                    Resolved complaints:
                    <asp:Label ID="Resolved_complaintsLabel" runat="server" Text='<%# Eval("[Resolved complaints]") %>' />
<br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="MIS531DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="with complaint_count as (
select type, count(*) as complaint_type_count,
dense_rank() over (order by count(*) desc) as count_rank
from complaints 
where empid in (select empid from cc_manages where managerid = :EMPID)
group by type
), top_complaints as (
select cc.type, status, complaint_type_count
from complaint_count cc join complaints c on cc.type = c.type
where count_rank &lt;= 3
)
select type, complaint_type_count as &quot;Total Complaints&quot;,o_c as &quot;Open complaints&quot;,
ip_c as &quot;In progress complaints&quot;, r_c &quot;Resolved complaints&quot; from top_complaints
PIVOT (
  count(*) as c
  for status in ('Open' as o, 
                 'In progress' as ip,
                'Resolved' as r)
                )
order by &quot;Total Complaints&quot; desc">
        <SelectParameters>
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        </div>

    </div>
</asp:Content>
