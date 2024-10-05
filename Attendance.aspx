<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Attendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Attendance</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />    <style>
        /* Main container styling */
        .container {
            margin-top: -60px;
            max-width: 950px;
        }

        /* Grid container styling */
        .grid-container {
            background-color: #f8f9fa;
            border-radius: 15px;
            padding: 20px;
            border:1px solid black;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        /* Table styling */
        .table {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;\
              
        }

        .table thead th {
            background-color: #343a40;
            color: white;
            text-align: center;
            font-weight: bold;
        }

        .table tbody td {
            text-align: center;
            vertical-align: middle;
        }

        .table-hover tbody tr:hover {
            background-color: #e9ecef;
        }

        /* DropDown styling */
        .dropdown-container {
            text-align: center;
        }

        .dropdown-container select {
            width: 100px;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ced4da;
        }

        /* Button Styling */
        .btn-custom {
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            min-width: 100px;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="container">
        <h2 class="text-center mb-4">Attendance Section</h2>
        <div class="grid-container">
            <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover"
                DataKeyNames="Id">
                <Columns>
                    <asp:BoundField DataField="RollNo" HeaderText="Roll No" />
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="dropdown-container">
                                <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True" CssClass="form-control form-control-sm"
                                    OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                    <asp:ListItem Text="Select Status" Value="" />
                                    <asp:ListItem Text="Present" Value="Present" />
                                    <asp:ListItem Text="Absent" Value="Absent" />
                                </asp:DropDownList>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>
