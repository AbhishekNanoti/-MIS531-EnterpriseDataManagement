<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="TripActions.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="jumbotron">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="OracleDataSource">
        <EditItemTemplate>
            Manager Name:
            <asp:TextBox ID="Manager_NameTextBox" runat="server" Text='<%# Bind("[Manager Name]") %>' />
            <br />
            Reporting Employee ID:
            <asp:TextBox ID="Reporting_Employee_IDTextBox" runat="server" Text='<%# Bind("[Reporting Employee ID]") %>' />
            <br />
            Reporting Employee Name:
            <asp:TextBox ID="Reporting_Employee_NameTextBox" runat="server" Text='<%# Bind("[Reporting Employee Name]") %>' />
            <br />
            Support Team ID:
            <asp:TextBox ID="Support_Team_IDTextBox" runat="server" Text='<%# Bind("[Support Team ID]") %>' />
            <br />
            Support Team Name:
            <asp:TextBox ID="Support_Team_NameTextBox" runat="server" Text='<%# Bind("[Support Team Name]") %>' />
            <br />
            Support Team Manager Contact:
            <asp:TextBox ID="Support_Team_Manager_ContactTextBox" runat="server" Text='<%# Bind("[Support Team Manager Contact]") %>' />
            <br />
            Support Team Agent Contact:
            <asp:TextBox ID="Support_Team_Agent_ContactTextBox" runat="server" Text='<%# Bind("[Support Team Agent Contact]") %>' />
            <br />
            Support Team Manager EmailID:
            <asp:TextBox ID="Support_Team_Manager_EmailIDTextBox" runat="server" Text='<%# Bind("[Support Team Manager EmailID]") %>' />
            <br />
            Support Team Agent EmailID:
            <asp:TextBox ID="Support_Team_Agent_EmailIDTextBox" runat="server" Text='<%# Bind("[Support Team Agent EmailID]") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Manager Name:
            <asp:TextBox ID="Manager_NameTextBox" runat="server" Text='<%# Bind("[Manager Name]") %>' />
            <br />
            Reporting Employee ID:
            <asp:TextBox ID="Reporting_Employee_IDTextBox" runat="server" Text='<%# Bind("[Reporting Employee ID]") %>' />
            <br />
            Reporting Employee Name:
            <asp:TextBox ID="Reporting_Employee_NameTextBox" runat="server" Text='<%# Bind("[Reporting Employee Name]") %>' />
            <br />
            Support Team ID:
            <asp:TextBox ID="Support_Team_IDTextBox" runat="server" Text='<%# Bind("[Support Team ID]") %>' />
            <br />
            Support Team Name:
            <asp:TextBox ID="Support_Team_NameTextBox" runat="server" Text='<%# Bind("[Support Team Name]") %>' />
            <br />
            Support Team Manager Contact:
            <asp:TextBox ID="Support_Team_Manager_ContactTextBox" runat="server" Text='<%# Bind("[Support Team Manager Contact]") %>' />
            <br />
            Support Team Agent Contact:
            <asp:TextBox ID="Support_Team_Agent_ContactTextBox" runat="server" Text='<%# Bind("[Support Team Agent Contact]") %>' />
            <br />
            Support Team Manager EmailID:
            <asp:TextBox ID="Support_Team_Manager_EmailIDTextBox" runat="server" Text='<%# Bind("[Support Team Manager EmailID]") %>' />
            <br />
            Support Team Agent EmailID:
            <asp:TextBox ID="Support_Team_Agent_EmailIDTextBox" runat="server" Text='<%# Bind("[Support Team Agent EmailID]") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Reporting Employee Name:
            <asp:Label ID="Reporting_Employee_NameLabel" runat="server" Text='<%# Bind("[Reporting Employee Name]") %>' />
            <br />
            Support Team ID:
            <asp:Label ID="Support_Team_IDLabel" runat="server" Text='<%# Bind("[Support Team ID]") %>' />
            <br />
            Support Team Name:
            <asp:Label ID="Support_Team_NameLabel" runat="server" Text='<%# Bind("[Support Team Name]") %>' />
            <br />
            Support Team Manager Contact:
            <asp:Label ID="Support_Team_Manager_ContactLabel" runat="server" Text='<%# Bind("[Support Team Manager Contact]") %>' />
            <br />
            Support Team Agent Contact:
            <asp:Label ID="Support_Team_Agent_ContactLabel" runat="server" Text='<%# Bind("[Support Team Agent Contact]") %>' />
            <br />
            Support Team Manager EmailID:
            <asp:Label ID="Support_Team_Manager_EmailIDLabel" runat="server" Text='<%# Bind("[Support Team Manager EmailID]") %>' />
            <br />
            Support Team Agent EmailID:
            <asp:Label ID="Support_Team_Agent_EmailIDLabel" runat="server" Text='<%# Bind("[Support Team Agent EmailID]") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="OracleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="WITH MANAGERS AS (
    select (fname || ' ' || lname) as &quot;empname&quot;, e.empID
    from cc_employees e
    where e.empID in (select distinct managerID from cc_manages)
),
SUPPORT AS (
    select m.&quot;empname&quot; as &quot;CC_Manager_Name&quot;,
    (e.fname || ' ' || e.lname) as &quot;CC_Employee_Name&quot;,
    e.empID as &quot;CC_Employee_ID&quot;,
    cm.managerID as &quot;CC_Manager_ID&quot;,
    c.name as &quot;Client_Company_Name&quot;,
    s.name as &quot;Support_Team_Name&quot;,
    ta.empID as &quot;TA_Mgr_ID&quot;,
    tcsa.empID as &quot;TA_Csa_ID&quot;,
    s.supportteamid as &quot;Support_Team_ID&quot;,
    count(distinct s.supportteamid) as &quot;Number of Support Teams&quot;
    from cc_manages cm
    join cc_employees e on cm.employeeid = e.empid
    join client_companies c on e.companyid = c.companyid
    join support_teams s on s.companyid = c.companyid
    join forms_managers fm on fm.supportteamid = s.supportteamid
    join forms_support_agents fsa on fsa.supportteamid = s.supportteamid
    join ta_managers ta on ta.empid = fm.empid
    join ta_customer_support_agents tcsa on tcsa.empid = fsa.empid
    join managers m on m.empID = cm.managerID
    where cm.managerID != e.empid
    group by m.&quot;empname&quot;, e.fname, e.lname, e.empID, cm.managerID, c.name,s.name,ta.empID, tcsa.empID,s.supportteamid
),
SUPPORTTEAM AS (
    select s.&quot;Support_Team_ID&quot;, s.&quot;Support_Team_Name&quot;,
    tm.fName as &quot;Support Team Manager Contact&quot;,
    tme.emailID as &quot;Support Team Manager EmailID&quot;,
    listagg(distinct tc.fName, ',') within group (order by tc.fName) as &quot;Support Team Agent Contact&quot;,
    listagg(distinct tce.emailID, ',') within group (order by tce.emailID) as &quot;Support Team Agent EmailID&quot; 
    from support s 
    join ta_employees tm on s.&quot;TA_Mgr_ID&quot; = tm.empID
    join ta_employees tc on s.&quot;TA_Csa_ID&quot; = tc.empID
    join ta_employees_emailid tme on s.&quot;TA_Mgr_ID&quot; = tme.empID
    join ta_employees_emailid tce on s.&quot;TA_Csa_ID&quot; = tce.empID
    group by s.&quot;Support_Team_ID&quot;, s.&quot;Support_Team_Name&quot;, tm.fName, tme.emailID
),
EMPLOYEE AS (
    select s.&quot;Support_Team_ID&quot;,s.&quot;CC_Manager_ID&quot;,
    listagg(distinct s.&quot;CC_Employee_ID&quot;, ',') within group (order by s.&quot;CC_Employee_ID&quot;) as &quot;CC_Employee_ID&quot;,
    listagg(distinct s.&quot;CC_Employee_Name&quot;, ',') within group (order by s.&quot;CC_Employee_Name&quot;) as &quot;CC_Employee_Name&quot; 
    from support s 
    group by s.&quot;Support_Team_ID&quot;,s.&quot;CC_Manager_ID&quot;
)
select distinct s.&quot;CC_Manager_Name&quot; as &quot;Manager Name&quot;,
e.&quot;CC_Employee_ID&quot; as &quot;Reporting Employee ID&quot;,
e.&quot;CC_Employee_Name&quot; as &quot;Reporting Employee Name&quot;,
s.&quot;Support_Team_ID&quot; as &quot;Support Team ID&quot;, 
s.&quot;Support_Team_Name&quot; as &quot;Support Team Name&quot;,
st.&quot;Support Team Manager Contact&quot; as &quot;Support Team Manager Contact&quot;,
st.&quot;Support Team Agent Contact&quot; as &quot;Support Team Agent Contact&quot;,
st.&quot;Support Team Manager EmailID&quot; as &quot;Support Team Manager EmailID&quot;,
st.&quot;Support Team Agent EmailID&quot; as &quot;Support Team Agent EmailID&quot;
from SUPPORTTEAM st
join employee e on st.&quot;Support_Team_ID&quot; = e.&quot;Support_Team_ID&quot;
join support s on s.&quot;Support_Team_ID&quot; = st.&quot;Support_Team_ID&quot;
where s.&quot;CC_Manager_ID&quot; = :EMPID">

    <SelectParameters>
    <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
    </SelectParameters>
    </asp:SqlDataSource>


</div>
</asp:Content>
