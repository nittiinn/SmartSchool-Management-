<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="YourDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container{
            margin-top:-60px;
        }

        .attendance-container {
            background-color: #f8f9fa; /* Light background for contrast */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .attendance-title {
            font-size: 28px;
            margin-bottom: 20px;
        }
        .attendance-label {
            font-size: 20px;
            margin-bottom: 10px;
        }
        #attendanceChart {
            border: 1px solid #ddd; 
            border-radius: 8px; 
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="container">
        <div class="attendance-container">
            <h2 class="text-center attendance-title">Student Attendance</h2>
            <asp:Label ID="lblPresentCount" runat="server" CssClass="attendance-label" Text=""></asp:Label>
            <br />
            <asp:Label ID="lblAbsentCount" runat="server" CssClass="attendance-label"></asp:Label>
            <br />
            <div id="attendanceChart" style="width:100%; height:400px;"></div>
        </div>
    </div>
    <script>
        function renderChart(presentCount, absentCount) {
            Highcharts.chart('attendanceChart', {
                chart: {
                    type: 'column' // or 'bar'
                },
                title: {
                    text: 'Student Attendance'
                },
                xAxis: {
                    categories: ['Present', 'Absent']
                },
                yAxis: {
                    title: {
                        text: 'Number of Students'
                    }
                },
                series: [{
                    name: 'Attendance',
                    data: [presentCount, absentCount]
                }],
                credits: {
                    enabled: false // Disable the Highcharts credits
                }
            });
        }
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>
