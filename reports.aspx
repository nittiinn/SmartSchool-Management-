<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="reports.aspx.cs" Inherits="reports" %>

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
        <h2 class="text-center">Study Reports</h2>
<%--        <div class="border border-primary rounded p-4 bg-light" style="max-width: 850px; margin: 0 auto;">--%>
<asp:GridView ID="reportsGridView" runat="server" CssClass="table table-responsive table-bordered" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="ID" />
        <asp:BoundField DataField="Semester" HeaderText="Semester" />
        <asp:BoundField DataField="Subject" HeaderText="Subject" />
        <asp:BoundField DataField="DateField" HeaderText="Date" />
        <asp:BoundField DataField="TimeField" HeaderText="Time" />

        <asp:TemplateField HeaderText="PDF">
            <ItemTemplate>
                <asp:HyperLink ID="pdfLink" runat="server" 
                    NavigateUrl='<%# Eval("PDFPath") %>'
                    Text="View PDF" 
                    Target="_blank" 
                    CssClass="btn btn-info" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Video">
            <ItemTemplate>
                <asp:HyperLink ID="videoLink" runat="server" 
                     NavigateUrl='<%# Eval("VideoPath") %>'    
                    Text="View Video" 
                    Target="_blank" 
                    CssClass="btn btn-warning" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

        </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>
