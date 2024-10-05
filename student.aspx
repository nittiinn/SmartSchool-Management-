<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="AddWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Student Registration</title>
    <style>
        .container{
            margin-top:-80px;
        }
        .registration-form {
            border: 2px solid #007bff; /* Blue border */
            border-radius: 30px; /* Rounded corners */
            padding: 20px; /* Padding inside the border */
            background-color: #f8f9fa; /* Light background color */
        }

        .form-group {
            margin-bottom: 15px; /* Spacing between form fields */
        }

        .row {
            margin-bottom: 20px; /* Space between rows */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="container" style="max-width: 900px;">
      
        <asp:Panel ID="RegistrationPanel" runat="server" CssClass="registration-form">
            <div class="row">
                  <h2 class="text-center">Student Registration Form</h2>
                <div class="form-group col-md-6">
                    <label for="txtName">Name:</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
                <div class="form-group col-md-6">
                    <label for="txtRollNo">Roll No:</label>
                    <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="txtApplicationNo">Application No:</label>
                    <asp:TextBox ID="txtApplicationNo" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
                <div class="form-group col-md-6">
                    <label for="txtEmail">Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required TextMode="Email"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="txtMobileNo">Mobile No:</label>
                    <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control" required></asp:TextBox>
                </div>
                <div class="form-group col-md-6">
                    <label for="txtDob">Date of Birth:</label>
                    <asp:TextBox ID="txtDob" runat="server" CssClass="form-control" required TextMode="Date"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="ddlGender">Gender:</label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select Gender" Value="" />
                        <asp:ListItem Text="Male" Value="Male" />
                        <asp:ListItem Text="Female" Value="Female" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                </div>
                <div class="form-group col-md-6">
                    <label for="txtPassword">Password:</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" required TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="text-center">
            <asp:Button ID="btnSubmit" runat="server" Text="Register" OnClick="btnSubmit_Click" CssClass="btn btn-primary w-25" />
            </div>
        </asp:Panel>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>
