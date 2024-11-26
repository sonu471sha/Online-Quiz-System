<%@ Page Title="" Language="C#" MasterPageFile="Website.Master" AutoEventWireup="true" CodeFile="TestGivenData.aspx.cs" Inherits="Quiz.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
        
    </style>
    <script>

        $(document).ready(function () {
            
            
            $(".dethid").hide();
            $(".inproces").hide();

            
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    </br>
    <center><h2>Student Result</h2></center>
    <form id="form1" runat="server">
        <br />
        <center><asp:GridView ID="students" AutoGenerateColumns="false" runat="server" Height="369px" Width="584px" CssClass="auto-style1" OnSelectedIndexChanged="students_SelectedIndexChanged1">
        <Columns>
            <asp:boundfield datafield="userid" HeaderText ="User ID" />
            
            <asp:boundfield datafield="test_name" headertext ="Test Name" />
            <asp:boundfield datafield="test_date" headertext ="Test Date" />

            <asp:TemplateField HeaderText ="Result">
            <ItemTemplate>

<%--                <asp:HyperLink ID="HyperLink1" Text="click here to check" runat="server" NavigateUrl='<%# "~StudentTestData.aspx?full_name=" + Server.UrlEncode(Eval("full_name").ToString()) %>' />--%>
<%--                <asp:HyperLink ID="student_result_link" Text="click here to check" runat="server" NavigateUrl='<%# Eval("userid", "./StudentTestData.aspx?userid=" + Server.UrlEncode(Eval("userid").ToString())) %>'/>--%>
                    <asp:HyperLink ID="student_result_link" Text="click here to check" runat="server" NavigateUrl='<%# Eval("userid", "./StudentTestData.aspx?userid=" + Server.UrlEncode(Eval("userid").ToString()) + "&test_name=" + Server.UrlEncode(Eval("test_name").ToString())) %>'/>

            </ItemTemplate>
        </asp:TemplateField>
<%--            <asp:hyperlinkfield headertext="result" text="click here to check" navigateurl='<%# eval("full_name", "./studenttestdata.aspx?full_name=" + server.urlencode(eval("full_name").tostring())) %>'/>--%>
            

        </Columns>
    </asp:GridView></center>
        <br />
    </form>
    <%-- <script type ="text/javascript">
         const table = document.getElementById('students');
         const rows = table.getElementsByTagName('Columns');
         for (let i = 1; i < rows.length; i++) {
             const cells = rows[i].getElementsByTagName('asp:boundfield');
             const test_given = cells[1].textContent;
             if (test_given == '1') {
                 const link = document.createelement('a');
                 link.href = 'https://www.google.com' + cells[0].textcontent;
             }
         }


    </script>--%>
</asp:Content>

<%--OnClick="student_result_Click"--%>
<%--  --%>