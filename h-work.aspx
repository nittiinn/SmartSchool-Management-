<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="h-work.aspx.cs" Inherits="h_work" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Form Example</title>
    <style>

        .container{
            margin-top:-80px;
        }
        .form-container {
            border: 2px solid #007bff;
            border-radius: 30px;
            padding: 20px; 
            background-color: #f8f9fa; 
        }

        .form-group {
            margin-bottom: 15px; /* Spacing between form fields */
        }

        label {
            font-weight: bold; /* Bold labels */
        }

        .btn-submit {
            margin-top: 10px; /* Space above the submit button */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="container" style="max-width:700px;">
        <h2 class="text-center">Form Submission</h2>
        <asp:Label ID="lblMessage" runat="server" CssClass="message-label" Visible="false"></asp:Label>

        <asp:Panel ID="FormPanel" runat="server" CssClass="form-container">
            <div class="form-group">
                <label for="ddlSubject">Subject:</label>
                <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" required="required">
                    <asp:ListItem Text="Select Subject" Value="" />
                    <asp:ListItem Text="Math" Value="Math" />
                    <asp:ListItem Text="Science" Value="Science" />
                    <asp:ListItem Text="History" Value="History" />
                    <asp:ListItem Text="Literature" Value="Literature" />
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="date">Date:</label>
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtHomeworkTitle">Homework Title:</label>
                <asp:TextBox ID="txtHomeworkTitle" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtSubmissionDate">Submission Date:</label>
                <asp:TextBox ID="txtSubmissionDate" runat="server" CssClass="form-control" TextMode="Date" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtDescription">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" required="required"></asp:TextBox>
            </div>
            <div class="text-center form-group btn-submit">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
            </div>
        </asp:Panel>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>
