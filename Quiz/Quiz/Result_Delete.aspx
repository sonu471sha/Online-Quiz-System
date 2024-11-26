<%@ Page Title="" Language="C#" MasterPageFile="./Website.Master" AutoEventWireup="true" CodeFile="Result_Delete.aspx.cs" Inherits="Quiz.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script>
        $(document).ready(function () {
            
            
            $(".dethid").hide();
            $(".inproces").hide();

            
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <center><h2>Result Record in Database</h2></center>
    <br/>
    <form id="form1" runat="server">
        <center><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="userid, test_name">
            <Columns>
                <asp:BoundField DataField="userid" HeaderText="userID" SortExpression="userID" />
                <asp:BoundField DataField="test_name" HeaderText="Test Name" SortExpression="test_name" />
                <asp:BoundField DataField="test_date" HeaderText="Test Date" SortExpression="test_date" />
                <asp:BoundField DataField="test_giv_at" HeaderText="Test Given Time" SortExpression="test_giv_at" />
                <asp:BoundField DataField="test_duration" HeaderText="Test Duration" SortExpression="test_duration" />
                <asp:BoundField DataField="tot_ques" HeaderText="Total Questions" SortExpression="tot_ques" />
                <asp:BoundField DataField="tot_attempt" HeaderText="Total attempt" SortExpression="tot_attempt" />
                <asp:BoundField DataField="tot_nt_attempt" HeaderText="Total not attempt" SortExpression="tot_nt_attempt" />
                <asp:BoundField DataField="tot_corr_anss" HeaderText="Total Correct Answers" SortExpression="tot_corr_anss" />
                <asp:BoundField DataField="tot_wro_anss" HeaderText="Total Wrong Answers" SortExpression="tot_wro_anss" />



                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this row?')" />

                    </ItemTemplate>
                </asp:TemplateField>



            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Delete all Records" OnClientClick="return confirm('Are you sure you want to delete all the records?')" />
        <br />
        <br />
        </center>
    </form>

</asp:Content>
