<%@ Page Title="Cards Statistics" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Cards.aspx.cs" Inherits="TripActions.Cards" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <div>
            <h2>Card Statistics</h2>
            <h3>Card Subscribes and Transactions</h3>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="MIS531DataSource">
                <ItemTemplate>
                    CARDNUM:
                    <asp:Label ID="CARDNUMLabel" runat="server" Text='<%# Eval("CARDNUM") %>' />
                    <br />
                    CARDTYPE:
                    <asp:Label ID="CARDTYPELabel" runat="server" Text='<%# Eval("CARDTYPE") %>' />
                    <br />
                    CATEGORY:
                    <asp:Label ID="CATEGORYLabel" runat="server" Text='<%# Eval("CATEGORY") %>' />
                    <br />
                    NOOFSUBSCRIBES:
                    <asp:Label ID="NOOFSUBSCRIBESLabel" runat="server" Text='<%# Eval("NOOFSUBSCRIBES") %>' />
                    <br />
                    NOOFTRANSACTIONS:
                    <asp:Label ID="NOOFTRANSACTIONSLabel" runat="server" Text='<%# Eval("NOOFTRANSACTIONS") %>' />
<br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="MIS531DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="with main as (

select c.cardnum, cardtype, category, count(empid) as noOfSubscribes

from cards c left outer join card_subscriptions cs

on c.cardnum = cs.cardnum

where empid in (select employeeid from cc_manages where managerid = :EMPID)

group by c.cardnum, cardtype, category

)

select m.cardnum, cardtype, category,  noOfSubscribes,

count(transactionid)as noOfTransactions from main m

left outer join card_expenses ce on ce.cardnum = m.cardnum

group by m.cardnum, noOfSubscribes, cardtype, category">
            <SelectParameters>
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </SelectParameters>
          </asp:SqlDataSource>
        </div>

        <div>
    <h3>Card and Employee Details</h3>
            <p>
                <asp:DataList ID="DataList2" runat="server" DataSourceID="Query1">
                    <ItemTemplate>
                        CARDNUM:
                        <asp:Label ID="CARDNUMLabel" runat="server" Text='<%# Eval("CARDNUM") %>' />
                        <br />
                        CURRENTEMPNAME:
                        <asp:Label ID="CURRENTEMPNAMELabel" runat="server" Text='<%# Eval("CURRENTEMPNAME") %>' />
                        <br />
                        CURRENTEMPID:
                        <asp:Label ID="CURRENTEMPIDLabel" runat="server" Text='<%# Eval("CURRENTEMPID") %>' />
                        <br />
                        PREVIOUSEMPNAME:
                        <asp:Label ID="PREVIOUSEMPNAMELabel" runat="server" Text='<%# Eval("PREVIOUSEMPNAME") %>' />
                        <br />
                        PREVIOUSEMPID:
                        <asp:Label ID="PREVIOUSEMPIDLabel" runat="server" Text='<%# Eval("PREVIOUSEMPID") %>' />
                        <br />
<br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="Query1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="WITH main AS (

    SELECT c.cardnum, cs.empid AS currempid, LEAD(cs.empid)

        OVER(PARTITION BY c.cardnum

             ORDER BY startdate DESC

        ) AS previousempid,

        RANK()

        OVER(PARTITION BY c.cardnum

             ORDER BY startdate DESC

        ) AS rankdate

    FROM card_subscriptions cs

        RIGHT OUTER JOIN cards c ON cs.cardnum = c.cardnum

    WHERE cs.empid IN (

            SELECT employeeid

            FROM cc_manages

            WHERE managerid = :EMPID

        )

), currempdetails AS (

    SELECT cardnum, coalesce(fname, 'Not subscribed currently') AS currentempname,coalesce(currempid, 'Not su bscribed currently') AS currentempid

    FROM main m

        LEFT OUTER JOIN cc_employees cce ON cce.empid = m.currempid

    WHERE rankdate = 1

), prevempdetails AS (

    SELECT cardnum, coalesce(fname, 'Previously not subscribed') AS previousempname, coalesce(previousempid, 'Previously not subscribed') AS previousempid

    FROM main m

        LEFT OUTER JOIN cc_employees cce ON cce.empid = m.previousempid

    WHERE rankdate = 1

)

SELECT *

FROM currempdetails ced

   NATURAL JOIN prevempdetails">
                                <SelectParameters>
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </SelectParameters>
                </asp:SqlDataSource>
            </p>

    </div>
    <div>
        <h2>List of open and inprogress Complaints</h2>
        <p>
            <asp:DataList ID="DataList3" runat="server" DataSourceID="Query2">
                <ItemTemplate>
                    num complaints:
                    <asp:Label ID="num_complaintsLabel" runat="server" Text='<%# Eval("[num complaints]") %>' />
                    <br />
                    complaints under a manager:
                    <asp:Label ID="complaints_under_a_managerLabel" runat="server" Text='<%# Eval("[complaints under a manager]") %>' />
                    <br />
                    manager id:
                    <asp:Label ID="manager_idLabel" runat="server" Text='<%# Eval("[manager id]") %>' />
                    <br />
                    department name:
                    <asp:Label ID="department_nameLabel" runat="server" Text='<%# Eval("[department name]") %>' />
                    <br />
                    department id:
                    <asp:Label ID="department_idLabel" runat="server" Text='<%# Eval("[department id]") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="Query2" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="WITH comp_mgr_dept AS (
    SELECT COUNT(complaintid) AS &quot;num complaints&quot;,
        LISTAGG(type, ', ') WITHIN GROUP(
        ORDER BY cm.managerid) AS &quot;complaints under a manager&quot;,
        cm.managerid AS &quot;manager id&quot;,
        deptname AS &quot;department name&quot;,
        cd.deptid AS &quot;department id&quot;
    FROM complaints c
        JOIN cc_manages cm ON c.empid = cm.employeeid
        JOIN consists co ON cm.managerid = co.empid
        JOIN cc_departments cd ON co.deptid = cd.deptid
        JOIN cc_managers ccm ON co.empid = ccm.managerid
        JOIN cc_employees cce ON ccm.managerid = cce.empid
    WHERE ( status = 'Open' OR status = 'In progress' )
    GROUP BY cm.managerid, deptname, cd.deptid
    HAVING COUNT(complaintid) &gt; 2
)
SELECT *
FROM comp_mgr_dept
WHERE &quot;manager id&quot; = :EMPID">
                            <SelectParameters>
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>
        </p>

    </div>
    <div>
        <h2>Card Requirements</h2>
        <p>
            <asp:DataList ID="DataList4" runat="server" DataSourceID="Query3">
                <ItemTemplate>
                    CATEGORY:
                    <asp:Label ID="CATEGORYLabel" runat="server" Text='<%# Eval("CATEGORY") %>' />
                    <br />
                    COUNT:
                    <asp:Label ID="COUNTLabel" runat="server" Text='<%# Eval("COUNT") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="Query3" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="SELECT category, COUNT(*) AS count

FROM cards

WHERE edate &gt; TO_DATE(add_months(sysdate, 1), 'DD-MON-YYYY')

    AND edate &lt; TO_DATE(add_months(sysdate, 2), 'DD-MON-YYYY')

    AND cardnum IN (

        SELECT DISTINCT cardnum

        FROM card_subscriptions cs

            JOIN cc_manages cm ON cm.employeeid = cs.empid

        WHERE managerid = :EMPID

    )

GROUP BY category">
                            <SelectParameters>
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>
        </p>

    </div>
    <div>
        <h2>Complaint Resolution Time</h2>
        <p>
            <asp:DataList ID="DataList5" runat="server" DataSourceID="Query4">
                <ItemTemplate>
                    TYPE:
                    <asp:Label ID="TYPELabel" runat="server" Text='<%# Eval("TYPE") %>' />
                    <br />
                    AVG_RESOLUTION_TIME:
                    <asp:Label ID="AVG_RESOLUTION_TIMELabel" runat="server" Text='<%# Eval("AVG_RESOLUTION_TIME") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="Query4" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="WITH main AS (

    SELECT DISTINCT lower(type) AS type, complaintid, filedate, resolvedate, status, empid

    FROM complaints c

        JOIN cc_manages cman ON c.empid = cman.employeeid

    WHERE managerid = :EMPID

), resolvedrestime AS (

    SELECT DISTINCT type, to_char(AVG(resolvedate - filedate)) AS avg_resolution_time

    FROM main

    WHERE status = 'Resolved'

    GROUP BY type

), unresolvedrestime AS (

    SELECT DISTINCT type, 'Undefined' AS avg_resolution_time

    FROM main

    WHERE type NOT IN (

        SELECT type

            FROM resolvedrestime

        )

)

SELECT *

FROM resolvedrestime

UNION

SELECT *

FROM unresolvedrestime">
                            <SelectParameters>
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>
        </p>

    </div>
    <div>
        <h2>Expenditure Summary based on Location and Description</h2>
        <p>
            <asp:DataList ID="DataList6" runat="server" DataSourceID="Query5">
                <ItemTemplate>
                    LOCATIONS:
                    <asp:Label ID="LOCATIONSLabel" runat="server" Text='<%# Eval("LOCATIONS") %>' />
                    <br />
                    SHOPS:
                    <asp:Label ID="SHOPSLabel" runat="server" Text='<%# Eval("SHOPS") %>' />
                    <br />
                    TOTAL_AMOUNT:
                    <asp:Label ID="TOTAL_AMOUNTLabel" runat="server" Text='<%# Eval("TOTAL_AMOUNT") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="Query5" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="SELECT coalesce(location, 'All Locations Total') AS locations,

    coalesce(description, 'All Shops Total')  AS shops, SUM(amount) AS total_amount

FROM (

SELECT DISTINCT cardnum, location, description, amount

        FROM card_expenses ce

        WHERE cardnum IN (

                SELECT DISTINCT cardnum

                FROM card_subscriptions

                WHERE empid IN (

                        SELECT empid

                        FROM cc_manages

                        WHERE managerid = :EMPID

                    )

            )

    )

GROUP BY CUBE(location, description)

ORDER BY total_amount DESC">
                            <SelectParameters>
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>
        </p>

    </div>
        <h2>Approved Departmental Claims</h2>
        <p>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="Query6" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="Month" HeaderText="Month" ReadOnly="True" SortExpression="Month" />
                    <asp:BoundField DataField="Manager ID" HeaderText="Manager ID" ReadOnly="True" SortExpression="Manager ID" />
                    <asp:BoundField DataField="Total Expenditure through Reimbursements made per month" HeaderText="Total Expenditure through Reimbursements made per month" ReadOnly="True" SortExpression="Total Expenditure through Reimbursements made per month" />
                    <asp:BoundField DataField="Amount Reimbursed" HeaderText="Amount Reimbursed" ReadOnly="True" SortExpression="Amount Reimbursed" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="Query6" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="WITH mngr_dept AS (

    SELECT DISTINCT managerid, deptid

    FROM cc_managers cm

        JOIN consists c ON cm.managerid = c.empid

), reimb_emp AS (

    SELECT to_char(expensedate, 'Month') AS &quot;Month&quot;, managerid AS &quot;Manager ID&quot;,

        ( CASE

                WHEN c.deptid IS NULL THEN 'Total for the Month'

                ELSE c.deptid

            END

        ) AS &quot;Total Expenditure through Reimbursements made per month&quot;,

        SUM(amount) AS &quot;Amount Reimbursed&quot;

    FROM reimbursements r

        JOIN consists  c ON r.empid = c.empid

        JOIN mngr_dept md ON md.deptid = c.deptid

    WHERE status = 'Approved'

    GROUP BY

        ROLLUP(to_char(expensedate, 'Month'), managerid, c.deptid)

)

SELECT *

FROM reimb_emp

WHERE

    &quot;Month&quot; IS NOT NULL

    AND &quot;Manager ID&quot; IS NOT NULL

    AND &quot;Total Expenditure through Reimbursements made per month&quot; IS NOT NULL

     AND &quot;Manager ID&quot; = :EMPID">
                            <SelectParameters>
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>
        </p>
    <div>
        <h2>Policy Details</h2>
        <p>
            <asp:DataList ID="DataList7" runat="server" DataSourceID="Query7">
                <ItemTemplate>
                    Policy ID:
                    <asp:Label ID="Policy_IDLabel" runat="server" Text='<%# Eval("[Policy ID]") %>' />
                    <br />
                    Count of Employees:
                    <asp:Label ID="Count_of_EmployeesLabel" runat="server" Text='<%# Eval("[Count of Employees]") %>' />
                    <br />
                    Policy:
                    <asp:Label ID="PolicyLabel" runat="server" Text='<%# Eval("Policy") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="Query7" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="WITH policyandemployeecount AS (

    SELECT p.policyid AS policyid, COUNT(empid) AS &quot;Count of Employees&quot;

    FROM cc_employees cce

        JOIN client_companies cc ON cc.companyid = cce.companyid

        JOIN contracts c ON cc.companyid = c.companyid

        JOIN policies p ON p.policyid = c.policyid

    WHERE cce.companyid = (

                SELECT companyid

                FROM cc_employees cce

                    JOIN cc_managers ccm ON cce.empid = ccm.managerid

                WHERE empid = 'E104'

            )

        AND c.contractid IN (

            SELECT contractid

            FROM active

        )

    GROUP BY p.policyid

)

SELECT policyid AS &quot;Policy ID&quot;, &quot;Count of Employees&quot;,

    CASE

        WHEN ( policyid IN (

            SELECT policyid

            FROM growth_plans

        ) ) THEN

                CASE

                    WHEN ( &quot;Count of Employees&quot; &gt;= 50 )

                    THEN 'Growth Plan. Please upgrade.' ELSE 'Growth Plan.'

                END

        WHEN ( policyid IN (

            SELECT policyid

            FROM professional_plans

        ) ) THEN 'Professional Plan'

    END AS &quot;Policy&quot;

FROM policyandemployeecount">
                            <SelectParameters>
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </div>
    <div>
        <h2>Late Reimbursements</h2>
        <p>
            <asp:DataList ID="DataList8" runat="server" DataSourceID="Query8">
                <ItemTemplate>
                    EMPID:
                    <asp:Label ID="EMPIDLabel" runat="server" Text='<%# Eval("EMPID") %>' />
                    <br />
                    REIMBURSEMENTID:
                    <asp:Label ID="REIMBURSEMENTIDLabel" runat="server" Text='<%# Eval("REIMBURSEMENTID") %>' />
                    <br />
                    EXPENSEDATE:
                    <asp:Label ID="EXPENSEDATELabel" runat="server" Text='<%# Eval("EXPENSEDATE") %>' />
                    <br />
                    AMOUNT:
                    <asp:Label ID="AMOUNTLabel" runat="server" Text='<%# Eval("AMOUNT") %>' />
                    <br />
                    TOTAL_LATE_REIMBURSEMENT_COUNTS:
                    <asp:Label ID="TOTAL_LATE_REIMBURSEMENT_COUNTSLabel" runat="server" Text='<%# Eval("TOTAL_LATE_REIMBURSEMENT_COUNTS") %>' />
                    <br />
                    AVG_NO_LATEDAYS_IN_MONTHS:
                    <asp:Label ID="AVG_NO_LATEDAYS_IN_MONTHSLabel" runat="server" Text='<%# Eval("AVG_NO_LATEDAYS_IN_MONTHS") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="Query8" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>" SelectCommand="WITH late_reimbursements AS (

    SELECT *

    FROM reimbursements

    WHERE status = 'Pending'

        AND months_between(sysdate, expensedate) &gt; 1

        AND empid IN (

            SELECT employeeid

            FROM cc_manages

            WHERE managerid = :EMPID

        )

), count_reimbursements AS (

    SELECT empid, COUNT(*) AS total_late_reimbursement_counts

    FROM late_reimbursements

    GROUP BY empid

), avg_latedays AS (

    SELECT

        empid, round(AVG(months_between(sysdate, expensedate)),2) AS avg_no_latedays_in_months

    FROM late_reimbursements

    GROUP BY empid

)

SELECT

    lr.empid,reimbursementid, expensedate,

    amount,total_late_reimbursement_counts, avg_no_latedays_in_months

FROM late_reimbursements lr

    JOIN count_reimbursements cr ON lr.empid = cr.empid

    JOIN avg_latedays al ON al.empid = lr.empid

WHERE amount &gt; 100">
                                            <SelectParameters>
                <asp:SessionParameter Name="EMPID" SessionField="empID" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>
        </p>

    </div>
    </div>
</asp:Content>
