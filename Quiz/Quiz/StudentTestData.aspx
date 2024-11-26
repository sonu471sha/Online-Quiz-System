<%@ Page Title="" Language="C#" MasterPageFile="Website.Master" AutoEventWireup="true" CodeFile="StudentTestData.aspx.cs" Inherits="Quiz.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        .auto-style1 {
        width: 300px;
    }
    .auto-style2 {
        width: 325px;
    }
        .auto-style3 {
            width: 88px;
            height: 50px;
        }
        .auto-style4 {
            height: 50px;
        }
        
        .nedes {
            
            background-color: gray;
            color: white;
			border-collapse: collapse;
			width: 100%;
			max-width: 800px;
			margin: 0 auto;
			font-size: 16px;
            border: 0px solid !important;
		}

        .auto-style5 {
            width: 300px;
            height: 40px;
        }
        .auto-style6 {
            width: 325px;
            height: 40px;
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
    <%-- <script src="jspdf/jspdf.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js" defer></script>


    <script type="text/javascript">
        //function printPanel() {
        //    var panel = document.getElementById("pr_pdf");
        //    var panelHtml = panel.innerHTML;
        //    var printWindow = window.open('', '', 'height=500,width=800');
        //    printWindow.document.write('<html><head><title>Print Panel</title></head><body>');
        //    printWindow.document.write(panelHtml);
        //    printWindow.document.write('</body></html>');
        //    printWindow.document.close();
        //    printWindow.focus();
        //    printWindow.print();
        //    printWindow.close();

        //}

        //function downloadPDF() {
        //    const doc = new jsPDF();
        //    doc.html(document.getElementById('pr_pdf'), {
        //        callback: function () {
        //            doc.save('result.pdf');
        //        }
        //    });

        //}


        //document.getElementById('download-pdf').addEventListener('click', function () {

        //    const panel = document.getElementById('pr_pdf');
        //    const doc = new jsPDF();
        //    doc.html(panel, {
        //        callback: function () {
        //            doc.save('result.pdf');
        //        }

        //    });
        //});


    </script>
    <center>
    <form id="form1" runat="server">
        <br/>
    <h2>
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
result</h2>
        <br/>
        <table class="nedes" style="width:100%;">
            <tr>
                <td>Marks per Question:</td>
                <td><asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required! " ControlToValidate="TextBox1" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please enter a valid marks!" ForeColor="#CC0000" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>

                </td>
            </tr>
            <tr>
                <td>Negative Marks per Question:</td>
                <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required! " ControlToValidate="TextBox2" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please enter a valid marks!" ForeColor="#CC0000" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>

                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update Marks" />
        <br />
        <div id="pr_pdf">
        <asp:Panel ID="Panel1" runat="server" Height="438px">
           
                
                    <table ID="myTable">
                <tr>
                    <td class="auto-style4"><strong>Total Marks</strong></td>
                    <td class="auto-style3"><strong>
                        <asp:Label ID="Label1" runat="server" ></asp:Label>
                /<asp:Label ID="Label2" runat="server" ></asp:Label>
                        </strong></td>
                </tr>
            </table>
                
            
            <table>
                <tr>
                    <td class="auto-style1"><strong>User id</strong></td>
                    <td class="auto-style2">
                        <asp:Label ID="User_id" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"><strong>Student Name</strong></td>
                    <td class="auto-style2">
                        <asp:Label ID="Stu_name" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"><strong>Test Name</strong></td>
                    <td class="auto-style2">
                        <asp:Label ID="tes_name" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"><strong>Test Date </strong></td>
                    <td class="auto-style2">
                        <asp:Label ID="tes_date" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"><strong>Test Given Time</strong></td>
                    <td class="auto-style2">
                        <asp:Label ID="tes_gvn_time" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style1"><strong>Test Duration</strong></td>
                    <td class="auto-style2">
                        <asp:Label ID="tes_dura" runat="server"></asp:Label>
                        minutes</td>
                </tr>
                <tr>
                    <td class="auto-style5"><strong>Total Number of Questions</strong></td>
                    <td class="auto-style6">
                        <asp:Label ID="No_of_Questions" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"><strong>Total Questions Attempted</strong></td>
                    <td class="auto-style2">
                        <asp:Label ID="Total_attempt" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"><strong>Total Questions not Attempted</strong></td>
                    <td class="auto-style2">
                        <asp:Label ID="Total_nt_attempt" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"><strong>Total Correct Answers</strong></td>
                    <td class="auto-style2">
                        <asp:Label ID="Tot_Corrans" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"><strong>Total Wrong Answerrs</strong></td>
                    <td class="auto-style2">
                        <asp:Label ID="Tot_Wroans" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click1" Text="Download Result" />
            </div>
        </form>
        <br /></center>
        

</asp:Content>
