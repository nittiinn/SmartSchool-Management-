<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="h-report.aspx.cs" Inherits="h_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Report Page</title>
    <style>
        /* Style for the entire page */
        .container {
            border: 1px solid #ccc; 
            padding: 20px;
            max-width: 900px; 
              border-radius: 40px;
            margin: -50px auto; 
            background-color: #f9f9f9; 
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); 
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .search-container {
            margin-bottom: 20px;
            display: flex;
            align-items: center; /* Align the items in the center */
        }

        .search-container label {
            margin-right: 10px;
        }

        .form-control {
            flex: 1; /* Make the text input fields take up available space */
            margin-right: 10px;
        }

        /* Button Styling */
        .btn {
            width: auto;
            padding: 5px 15px; /* Make buttons smaller */
        }

        /* GridView Styling */
        .table {
            width: 100%;
            margin-bottom: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-collapse: collapse;
        }

        .table-container {
            overflow-x: auto; /* Horizontal scrolling for GridView */
        }

        .table th, .table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .table th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        .table-striped tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            .table th, .table td {
                padding: 8px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="container">
        <h2>Search Reports</h2>
                    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
        <div class="search-container">
            <label for="txtSearchDate">Search by Date:</label>
            <asp:TextBox ID="txtSearchDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            <asp:Button ID="btnSearchDate" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearchDate_Click" />
        </div>

        <div class="search-container">
            <label for="ddlSearchSubject">Search by Subject:</label>
            <asp:DropDownList ID="ddlSearchSubject" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Subject" Value="" />
                <asp:ListItem Text="Math" Value="Math" />
                <asp:ListItem Text="Science" Value="Science" />
                <asp:ListItem Text="History" Value="History" />
                <asp:ListItem Text="Literature" Value="Literature" />
            </asp:DropDownList>
            <asp:Button ID="btnSearchSubject" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearchSubject_Click"/>
        </div>

        <!-- GridView Container with Scrolling -->
        <div class="table-container">
            <asp:GridView ID="gvReports" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="Subject" HeaderText="Subject" />
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="HomeworkTitle" HeaderText="Homework Title" />
                    <asp:BoundField DataField="SubmissionDate" HeaderText="Submission Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>
