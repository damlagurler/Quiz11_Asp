<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="Quiz11_AspBlog.Quiz" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
       body{
           margin:0px;
           margin-top:-20px;
       }
        #top{
            width:1300px;
            height:150px;
            background-color:#94b71a;
            margin-top:0px;
            float:left;
        }
        #soz{
            width:500px;
            height:50px;
            background-color:#926526;
            color:gold;
            font-size:20px;
            font-weight:bold;
            font-family:Verdana;
            position:center;
            align-items:center;
            justify-content:center;
            display:flex;
            margin-left:350px;
            margin-right:200px;
            margin-top:30px;
            position:absolute;
            border:2px solid;
            border-color:#926526;
            border-radius:10px;
            
        }
        #basliklar{
            margin-top:100px;
            height:40px;
            width:950px;
        }
        #konu_tab,#profil_tab,#iletisim_tab{
            background-color:#926526;
            color:white;
            float:left;
            margin:6px;
            margin-left:160px;
            font-size:20px;
            font-weight:bold;
            font-family:Verdana;
            align-items:center;
            justify-content:center;
            display:flex;
            height:30px;
            width:150px;
            border-radius:10px;

        }
        #konu_tab:hover,#profil_tab:hover,#iletisim_tab:hover{
            text-decoration:underline;
            font-size:21px;
        }

        #div_ana{
            width:1300px;
            height: 700px;
            background-color:#becb7c;
        }
        #div_altkonular{
            width:200px;
            height:auto;
            background-color:#d1a03a;
            color:#4d2e19;
            font-family:Verdana;
            font-size:15px;
            font-weight:bold;
            margin-left:130px;
            margin-top:-10px;
            border-radius:10px;
            margin-top:160px;
            position:absolute;
            display:none;
        }
        #div_profil{
            width:200px;
            height:auto;
            background-color:#d1a03a;
            color:#4d2e19;
            font-family:Verdana;
            font-size:15px;
            font-weight:bold;
            margin-left:450px;
            margin-top:-10px;
            border-radius:10px;
            margin-top:160px;
            position:absolute;
            display:none;
        }
        #div_profilayrinti{
            width:200px;
            height:auto;
            background-color:#d1a03a;
            color:#4d2e19;
            font-family:Verdana;
            font-size:15px;
            font-weight:bold;
            margin-left:450px;
            margin-top:300px;
            border-radius:10px;
            position:absolute;
            display:none;
        }

        #div_duyuru{
            float:right;
            background-color:#dcba21;
            color:#4e5b31;
            width:300px;
            height:700px;
            font-family:Verdana;
            font-weight:100;

        }
        .li_isim{
            font-family:Verdana;
            font-size:16px;
            color:lightgoldenrodyellow;
        }

        #div_iletisim{
            display:none;
            height:auto;
            width:200px;
            background-color:#d1a03a;
            color:#4d2e19;
            font-family:Verdana;
            font-size:15px;
            font-weight:bold;
            margin-top:-10px;
            border-radius:10px;
            margin-top:160px;
            position:absolute;
            margin-left:770px;
           
            
        }


    </style>
    <script src="js/jquery-3.1.0.min.js"></script>
    <script>
      $(document).ready(function () {
            $("#konu_tab").click(function () {
                $("#div_altkonular").toggle("slow");
               
            })
            $("#profil_tab").click(function () {
               
                $("#div_profil").toggle("slow");
                $(".li_isim").click(function () {
                    $("#div_profilayrinti").toggle("slow");
                    
                })
             
            })
            $("#iletisim_tab").click(function () {
                $("#div_iletisim").toggle("slow");
            })

        })

    </script>

</head>
<body>
    <form id="form1" runat="server">
     <div id="anasayfa">   
        <div id="top">
                <span id="soz">
                <asp:Repeater ID="repeater_soz" runat="server">
                    <ItemTemplate>Bugünün sözü:<%#Eval("soz")%></ItemTemplate>
                </asp:Repeater>
            </span>
            <div id="basliklar">
                 <div id="konu_tab" title="konu">Konular</div>
                 <div id="profil_tab" title="profil">Profil</div>
                 <div id="iletisim_tab">İletişim</div>
            </div>
        </div>
        <div id="div_ana">
            <div id="div_altkonular">
                <ul>
                    <asp:Repeater ID="repeater_konu" runat="server" OnItemDataBound="repeater_konu_ItemDataBound">
                        <ItemTemplate>
                            <li><%#Eval("konuAd")%>
                                <ul>
                                    <asp:Repeater ID="repeater_altkonu" runat="server">
                                        <ItemTemplate>
                                            <li><%#Eval("altKonuAd")%></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    
                                </ul>

                            </li> 

                        </ItemTemplate>
                    </asp:Repeater>
               

                </ul>
          </div>
          
          <div id="div_profil">
              <ul style="color:;font-weight:700; font-family:Verdana;font-size:19px;">HAKKINDA
                  <asp:Repeater ID="repeater_profil" runat="server" OnItemDataBound="repeater_profil_ItemDataBound" >
                      <ItemTemplate>
                          <li class="li_isim"><%#Eval("ad")+" "+Eval("soyad")%></li>

                      </ItemTemplate>
                  </asp:Repeater>
              </ul>
          </div>
            
            <div id="div_profilayrinti">
                <ul>
                    <asp:Repeater ID="repeater_profilayrinti" runat="server">
                        <ItemTemplate>
                            <li>Ad:<%#Eval("ad")%></li>
                            <li>Soyad:<%#Eval("soyad")%></li>
                            <li>Mesleği:<%#Eval("meslekAd")%></li>
                            <li>Hakkında:<%#Eval("hakkinda")%></li>

                        </ItemTemplate>
                    </asp:Repeater> 
                  


                </ul>

            </div>
            <div id="div_duyuru">
                <span style="color:crimson; font-size:19px; font-weight:bold; font-family:Verdana; position:center; margin-left:20px;">DUYURU</span>

                <marquee align="middle" scrollamount="1" height="60" width="100%" direction="up"scrolldelay="1">
                <p>Göçmen kuşlar haber veriyor ufukta nehirler akıyo aaaa durmayalım aaa kırlangıçlar gibi aa yolumuz uzun... </p>
                <br />
                <p>Öyle bir rüya öyle</p>
                <br />
                <p>Every webpage you look at is written in a language called HTML. You can think of HTML as the skeleton that gives every webpage structure. </p>
                <br />
                <p>Musluğu açtım tıpasını taktım sonra lumos dedim ama çarşı karıştı.</p>


                </marquee>
               

            </div>
            <div id="div_iletisim">
                <span>Telefon Numarası:(0000) 000 00 00</span>
                <br />
                <span>E-mail: asd@asd.com</span>

            </div>

        </div>
    
    </div>
    </form>
</body>
</html>
