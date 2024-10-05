<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="details.aspx.cs" Inherits="details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        .container {
            border-radius: 50px;
            margin: -60px auto;
            max-width: 850px;
            border: 2px solid #007bff;
            border-radius: 40px;
            padding: 20px;
            background-color: #f8f9fa;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="container">
        <h2 class="text-center">Upload Study Material</h2>
        <%--        <div class="border-primary rounded p-4 bg-light">--%>
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="semesterDropdown">Select Semester:</label>
                <asp:DropDownList ID="semesterDropdown" runat="server" CssClass="form-control">
                    <asp:ListItem Value="" Text="Select Semester" />
                    <asp:ListItem Value="1" Text="Semester 1" />
                    <asp:ListItem Value="2" Text="Semester 2" />
                    <asp:ListItem Value="3" Text="Semester 3" />
                    <asp:ListItem Value="4" Text="Semester 4" />
                </asp:DropDownList>
            </div>
            <div class="col-md-6">
                <label for="subjectDropdown">Select Subject:</label>
                <asp:DropDownList ID="subjectDropdown" runat="server" CssClass="form-control">
                    <asp:ListItem Value="" Text="Select Subject" />
                    <asp:ListItem Value="Math" Text="Mathematics" />
                    <asp:ListItem Value="Physics" Text="Physics" />
                    <asp:ListItem Value="Chemistry" Text="Chemistry" />
                    <asp:ListItem Value="Biology" Text="Biology" />
                </asp:DropDownList>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="dateField">Date:</label>
                <asp:TextBox ID="dateField" runat="server" CssClass="form-control" TextMode="Date" />
            </div>
            <div class="col-md-6">
                <label for="timeField">Time:</label>
                <asp:TextBox ID="timeField" runat="server" CssClass="form-control" TextMode="Time" />
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="pdfUpload">Upload PDF:</label>
                <asp:FileUpload ID="pdfUpload" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <label for="videoUpload">Upload Video:</label>
                <asp:FileUpload ID="videoUpload" runat="server" CssClass="form-control" />
            </div>
        </div>

        <div class="row mb-3">
            <div class="col text-center">
                <asp:Button ID="submitButton" OnClick="submitButton_Click" runat="server" Text="Submit" CssClass="btn btn-primary w-25" />
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>
