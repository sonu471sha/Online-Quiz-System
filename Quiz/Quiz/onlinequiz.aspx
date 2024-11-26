<%@ Page Language="C#" AutoEventWireup="true" CodeFile="onlinequiz.aspx.cs" Inherits="Quiz.onlinequiz" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="fontawesome-free-6.3.0-web/css/all.css" rel="stylesheet" />

    <script src="jQuery/jquery.js"></script>
    <style type="text/css">
        
        body {
        /*background: linear-gradient( to top, whitesmoke 0%, whitesmoke 50%, whitesmoke 50%, #A8A8A8 50%);*/
        background-color: whitesmoke;

        }
        

        
        table {
            
            background-color: white;
			border-collapse: collapse;
			width: 100%;
			max-width: 800px;
			margin: 0 auto;
			font-size: 16px;
		}
        .bord {
            border: 1px solid black;
            
        }

        
        h4{
            font-weight:normal;
            
            color:white;
            background-color:darkgray;
            display:inline;
            padding:5px;

        }

		th, td {
			padding: 8px;
			
			text-align: left;
		}

		th {
			background-color: #f2f2f2;
			font-weight: bold;
		}

        tr{
            width: 100%;
            display: flex;
            justify-content:space-around;
        }
		@media only screen and (max-width: 600px) {
			table {
				font-size: 14px;
			}
			th, td {
				padding: 6px;
			}
		}
        @media only screen and (max-width: 400px) {
            table {
                font-size: 12px;
                
            }

            th, td {
                padding: 4px;
            }
        }
        .boldd{
                        font-weight: bold;

        }
        .equal_space{
            display: flex;
            justify-content:space-around;
        }
        .equal_space button {
            flex: 1;
            margin-right: 10px;
        }
        .equal_space button:last-child {
            margin-right: 0px;
        }
        .bbb{
            color:black;
        }

        .auto-style1 {
            width: calc(45%);
            height: 339px;
        }
        .auto-style2 {
            width: calc(55%);
            height: 339px;
            
        }
        .auto-style4 {
            height: 5px;
        }
        </style>





    <script>

        document.addEventListener("DOMContentLoaded", function () {
            function shuffleArray(array) {
                for (let i = array.length - 1; i > 0; i--) {
                    const j = Math.floor(Math.random() * (i + 1));
                    [array[i], array[j]] = [array[j], array[i]];
                }
                return array;
            }

            const radioButtons = $(".my-radio").toArray();
            const shuffledRadioButtons = shuffleArray(radioButtons);
            const container = $(".radio-container");

            container.empty();
            shuffledRadioButtons.forEach((radioButtons) => {
                container.append(radioButtons);
                container.append("<br>")
            });

        });
    </script>

    <script> var t_q = "<%=t_q%>"; </script>

    <script> var exam_time = "<%=exam_time%>"; </script>



    <script>


        function convertMinToHrsAndMins(minutes) {
            let hours = Math.floor(minutes / 60);
            let remainingMinutes = minutes % 60;

            let hoursString = hours === 1 ? '1 hour' : hours + ' hours';
            let minutesString = remainingMinutes === 1 ? '1 minute' : remainingMinutes + ' minutes';

            if (hours === 0) {
                return minutesString;
            }
            else if (remainingMinutes === 0) {
                return hoursString;
            }
            else {
                return hoursString + ' and ' + minutesString;

            }
        }


        function ConfirmSubmit() {
            if (confirm("Are you sure you want to submit the Test?")) {
                localStorage.removeItem('endTime');
                //location.reload();
                return true;

            }
            else {
                return false;
            }
        }

        $(document).ready(function () {
            $("#Button1").hide();
            $(".myButton").hide();

            for (var i = 1; i <= t_q; i++) {
                $('#btn_Q' + i).show();
            }
        });
        

        document.addEventListener("DOMContentLoaded", function () {

            var sub_but = document.getElementById('Button1');
            let test_duration = exam_time;
            let test_dur = convertMinToHrsAndMins(test_duration);
            document.getElementById('Label8').innerHTML = test_dur;

            var endTime = localStorage.getItem('endTime');
            if (!endTime) {
                endTime = new Date();
                endTime.setMinutes(endTime.getMinutes() + <%=exam_time%>);
                localStorage.setItem('endTime', endTime);
            }
            else {
                endTime = new Date(endTime);
            }
            setInterval(function () {
                var currentTime = new Date();
                var remainingTime = endTime.getTime() - currentTime.getTime();

                if (remainingTime <= 0) {
                    remainingTime = 0;
                    localStorage.removeItem('endTime');
                    sub_but.click();

                }


                var hours = Math.floor(remainingTime / (1000 * 60 * 60));
                var minutes = Math.floor((remainingTime % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((remainingTime % (1000 * 60)) / 1000);

                var timerElement = document.getElementById("Label7");
                timerElement.innerHTML = hours + "h " + minutes + "m " + seconds + "s";

                if (timerElement.innerHTML == "0h 5m 0s") {
                    alert('Hurry Up! You just have 5 minutes left!');
                }
                if (timerElement.innerHTML == "0h 2m 0s") {
                    alert('The Test will automatically end up in 2 minutes!');
                }

            }, 1000);

        });



    </script>
</head>
<body>
    <form id="form1" runat="server">
        </br>
        <center><h4 style="text-align: center">Userid:
            <asp:Label ID="Label15" runat="server" ></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Test Name:
            <asp:Label ID="Label4" runat="server"></asp:Label></h4></center>
        </br>
        <table>
            <tr>
                <td class="boldd" style="text-align: center; width : calc(100% / 3); " >
                    <asp:Label ID="Label1" runat="server" Text="Start Time"></asp:Label>&nbsp;</td>
                <td class="boldd" style="text-align: center; width : calc(100% / 3);" >
                    <asp:Label ID="Label3" runat="server" Text="Remaining Time"></asp:Label></td>
                <td class="boldd" style="text-align: center; width : calc(100% / 3);" >
                    <asp:Label ID="Label2" runat="server" Text="Test Duration" OnDataBinding="Page_Load"></asp:Label>

                             <asp:Button ID="Button1" Height="1px" Width="1px" runat="server" OnClick="Button1_Click1" />

                </td>
            </tr>
            <tr >
                <td style="text-align: center; width : calc(100% / 3);" >

                    <asp:Label ID="Label6" runat="server"></asp:Label>
                    &nbsp;
                        <asp:Label ID="Label9" runat="server"></asp:Label>
                </td>
                <td style="text-align: center; width : calc(100% / 3); ">

                    <asp:Label ID="Label7" runat="server" ></asp:Label>

                </td>
                <td  style="text-align: center; width : calc(100% / 3);">
                    <asp:Label ID="Label8" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td colspan="3" style="text-align: center; width: 100%" >

                        <asp:Label ID="Label10" runat="server" Height="28px" Width="30px"></asp:Label>
                        Not Answered&nbsp;&nbsp;
                       
                        <asp:Label ID="Label11" runat="server" Height="28px" Width="30px"></asp:Label>
                        Marked for Review&nbsp;&nbsp;
                        
                        <asp:Label ID="Label12" runat="server" Height="28px" Width="30px"></asp:Label>
                        Answered & Marked for Review&nbsp;&nbsp;
                        
                        <asp:Label ID="Label13" runat="server" Height="28px" Width="30px"></asp:Label>
                        Answered
                        <br />
                    <br />
                        <div class="boldd"><asp:Label ID="Label14" runat="server" Text="The test will automatically submit when time's up! OR click submit to end up early!"></asp:Label><br />
                            After submission, you will automatically logout and the records will be saved!</div>
                    <br />
                        </td>
                
            </tr>

        </table>

        </div>
        <hr class="auto-style4"/>

        <div>
            <table class="bord">
                <tr>

                    <td style="text-align: left; " class="auto-style1" >
                        
                        <br />
                        
                        
                        <div style="text-align: left; " >
                            <asp:Button class="myButton" ID="btn_Q1" runat="server" Text="1" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q2" runat="server" Text="2" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q3" runat="server" Text="3" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q4" runat="server" Text="4" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q5" runat="server" Text="5" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q6" runat="server" Text="6" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q7" runat="server" Text="7" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q8" runat="server" Text="8" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q9" runat="server" Text="9" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q10" runat="server" Text="10" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            </br>
                        <asp:Button class="myButton" ID="btn_Q11" runat="server" Text="11" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q12" runat="server" Text="12" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q13" runat="server" Text="13" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q14" runat="server" Text="14" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q15" runat="server" Text="15" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q16" runat="server" Text="16" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q17" runat="server" Text="17" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q18" runat="server" Text="18" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q19" runat="server" Text="19" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q20" runat="server" Text="20" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <br />
                            <asp:Button class="myButton" ID="btn_Q21" runat="server" Text="21" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q22" runat="server" Text="22" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q23" runat="server" Text="23" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q24" runat="server" Text="24" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q25" runat="server" Text="25" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q26" runat="server" Text="26" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q27" runat="server" Text="27" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q28" runat="server" Text="28" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q29" runat="server" Text="29" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q30" runat="server" Text="30" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            </br>
                        <asp:Button class="myButton" ID="btn_Q31" runat="server" Text="31" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q32" runat="server" Text="32" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q33" runat="server" Text="33" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q34" runat="server" Text="34" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q35" runat="server" Text="35" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q36" runat="server" Text="36" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q37" runat="server" Text="37" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q38" runat="server" Text="38" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q39" runat="server" Text="39" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q40" runat="server" Text="40" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <br />
                            <asp:Button class="myButton" ID="btn_Q41" runat="server" Text="41" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q42" runat="server" Text="42" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q43" runat="server" Text="43" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q44" runat="server" Text="44" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q45" runat="server" Text="45" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q46" runat="server" Text="46" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q47" runat="server" Text="47" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q48" runat="server" Text="48" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q49" runat="server" Text="49" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q50" runat="server" Text="50" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            </br>
                        <asp:Button class="myButton" ID="btn_Q51" runat="server" Text="51" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q52" runat="server" Text="52" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q53" runat="server" Text="53" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q54" runat="server" Text="54" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q55" runat="server" Text="55" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q56" runat="server" Text="56" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q57" runat="server" Text="57" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q58" runat="server" Text="58" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q59" runat="server" Text="59" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q60" runat="server" Text="60" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <br />
                            <asp:Button class="myButton" ID="btn_Q61" runat="server" Text="61" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q62" runat="server" Text="62" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q63" runat="server" Text="63" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q64" runat="server" Text="64" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q65" runat="server" Text="65" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q66" runat="server" Text="66" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q67" runat="server" Text="67" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q68" runat="server" Text="68" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q69" runat="server" Text="69" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q70" runat="server" Text="70" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            </br>
                        <asp:Button class="myButton" ID="btn_Q71" runat="server" Text="71" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q72" runat="server" Text="72" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q73" runat="server" Text="73" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q74" runat="server" Text="74" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q75" runat="server" Text="75" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q76" runat="server" Text="76" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q77" runat="server" Text="77" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q78" runat="server" Text="78" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q79" runat="server" Text="79" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q80" runat="server" Text="80" OnClick="btn_Q1_Click" Height="26px" Width="28px" />

                            <br />
                            <asp:Button class="myButton" ID="btn_Q81" runat="server" Text="81" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q82" runat="server" Text="82" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q83" runat="server" Text="83" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q84" runat="server" Text="84" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q85" runat="server" Text="85" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q86" runat="server" Text="86" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q87" runat="server" Text="87" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q88" runat="server" Text="88" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q89" runat="server" Text="89" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q90" runat="server" Text="90" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            </br>
                        <asp:Button class="myButton" ID="btn_Q91" runat="server" Text="91" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q92" runat="server" Text="92" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q93" runat="server" Text="93" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q94" runat="server" Text="94" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q95" runat="server" Text="95" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q96" runat="server" Text="96" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q97" runat="server" Text="97" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q98" runat="server" Text="98" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q99" runat="server" Text="99" OnClick="btn_Q1_Click" Height="26px" Width="28px" />
                            <asp:Button class="myButton" ID="btn_Q100" runat="server" Text="100" OnClick="btn_Q1_Click" Height="26px" Width="28px" />



                        </div>
                        <br />

                    </td>


                     
                    <td class="auto-style2">
                        <asp:Panel ID="Panel2" runat="server">
                            <asp:Label ID="Qno" runat="server" Text="Label"></asp:Label>.
                            &nbsp;
                            <asp:Label ID="QD" runat="server" Text="Label"></asp:Label>
                        </asp:Panel>
                        <div style="margin-left:20px;">
                            <br />
<asp:RadioButton ID="A" class="my-radio" runat="server" AutoPostBack="True" GroupName="ans" OnCheckedChanged="RadioButton1_CheckedChanged" />
                            <br />
                            <asp:RadioButton ID="B" class="my-radio" runat="server" AutoPostBack="True" GroupName="ans" OnCheckedChanged="B_CheckedChanged" />
                            <br />
                        <asp:RadioButton ID="C" class="my-radio" runat="server" AutoPostBack="True" OnCheckedChanged="C_CheckedChanged" GroupName="ans" />
                            <br />
                            <asp:RadioButton ID="D" class="my-radio" runat="server" AutoPostBack="True" GroupName="ans" OnCheckedChanged="D_CheckedChanged" />
                            <br />
                            <br />
                        </div>
                    </td>

                    

                </tr>

                <tr>
                    <td style="text-align: center; width: 100% " colspan="2">
                        <br />
                        <div class="equal_space" >
                            <span><asp:Button ID="Button3" runat="server" OnClick="Button3_Click" class="btn btn-info" Height="40px" Text="Save &amp; Mark for Review" /></span>


                        <span><asp:Button ID="Button2" class="btn btn-success" runat="server" OnClick="Button2_Click" Height="40px" Text="Save" Width="126px" /></span>


                        <span><asp:Button ID="Button4" runat="server" OnClick="Button4_Click1" class="btn btn-outline-secondary" Text="Clear Response" Height="40px" /></span></div>
                        </div>

                        <br />
                    </td>

                </tr>

                <tr>
                    <td  style="text-align: center; width: 100%" colspan="2">
                        <br />
                        <div class="equal_space" >
                        <span><asp:Button ID="btn_First" runat="server" class="btn btn-primary" Text="First" Height="40px" OnClick="btn_First_Click" Width="150px" /></span>


                        <span><asp:Button ID="btn_Previous" runat="server" Text="Previous" class="btn btn-primary" Height="40px" Width="150px" OnClick="btn_Previous_Click" /></span>


                        <span><asp:Button ID="btn_Next" runat="server" Text="Next" class="btn btn-primary" Height="40px" Width="150px" OnClick="btn_Next_Click" /></span>


                        <asp:Button ID="btn_last" class="btn btn-primary" runat="server" Text="Last" Height="40px" Width="150px" OnClick="btn_last_Click" />
                            </div>
                        <br />
                    </td>

                </tr>

            </table>
        </div>
        <hr class="auto-style4" />


        <p><center>
            <asp:Button type="submit" ID="btn_Submit1" runat="server" Text="Submit" OnClick="btn_Submit1_Click" OnClientClick="return ConfirmSubmit();" />
            <br />
            
           </center>
            
        </p>
        
    </form>
</body>
</html>
