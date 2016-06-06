<%-- 
    Document   : index
    Created on : 2/06/2016, 02:15:58 PM
    Author     : Lab5-E
--%>
<%
if(session.getAttribute("userNameSystemUser") == null){%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <html>
        <head>

            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
            <title>Carrera Atlética</title>

            <!-- CSS  -->
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
            <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

            <style>
                .circulo {
                    width: 60px;
                    height: 60px;
                    -moz-border-radius: 50%;
                    -webkit-border-radius: 50%;
                    border-radius: 50%;
                    background: #fff;
                }
                .img-login{
                    background-image: url(login.png);
                    background-size: 20%;
                    background-repeat: no-repeat;
                    background-position: center;
                    width: 100%;
                    display: inline-block;
                    height: 20%;
                }
                .modal.modal-fixed-footer{
                    height: 360px;
                }
            </style>
        </head>
        <body>
            <nav class="white teal darken-1" role="navigation">
                <div class="nav-wrapper container">
                    <a id="logo-container" href="/carrera-atletica/" class="brand-logo teal-text darken-3 circulo" style="font-size: 30px; font-style: italic; padding-left: 5px; font-weight: bolder;">
                        <span class="strech">U<span style="font-size: 40px;">T</span></span>
                    </a>
                    <a id="logo2-container" href="#" class="brand-logo right teal-text darken-3 circulo" style="font-size: 30px; font-style: italic; padding-left: 5px; font-weight: bolder;">
                        <span class="strech">U<span style="font-size: 40px;">T</span></span>
                    </a>
                    <ul class="right hide-on-med-and-down" style="margin-right: 100px">
                        <li><a href="#login" class="white-text lighten-5 modal-trigger">INGRESAR</a></li>
                    </ul>

                    <ul id="nav-mobile" class="side-nav teal darken-1">
                        <li><a href="#login" class="white-text lighten-5 modal-trigger">INGRESAR</a></li>
                    </ul>
                    <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
                </div>
            </nav>
            <div>
                <div style="z-index: 1003; display: none; opacity: 0; transform: scaleX(0.7); top: 152.884px;" id="login" class="modal modal-fixed-footer">
                    <div class="teal darken-1" style="top: 0px; height: 32px; text-align: center">
                        <span class="header center white-text text-darken-2" style="font-size: 18px; font-weight: bolder">Iniciar Sesión</span>
                    </div>
                    <form id="form-login" class="" lang="es" action="#" method="POST">
                        <div class="modal-content">
                            <div class="row" style="margin-bottom: 0px">
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="email" type="email" name="userName" class="validate" required="" data-errormessage-value-missing="Please input something">
                                        <label for="email">Correo Electrónico</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="password" name="password" type="password" class="validate" required="">
                                        <label for="password">Contraseña</label>
                                    </div>
                                </div>
                            </div>
                            <div id="message" class="center"></div>

                            <div class="progress" style="display: none">
                                <div class="indeterminate"></div>
                            </div>  
                        </div>                

                        <div class="modal-footer teal darken-1">

                            <button style="padding: 5px" class="modal-action modal-close waves-effect waves-teal btn-flat white  btn waves-effect waves-light" name="action">Cancelar
                                <i class="material-icons right">replay</i>
                            </button>
                            <button style="margin-right: 10px; padding: 5px" class="waves-effect waves-teal btn-flat white  btn waves-effect waves-light" id="send" type="submit" >Entrar
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>      
            <div id="index-banner" class="parallax-container">
                <div class="">
                    <div class="container">
                        <br><br>
                        <h1 class="header center blue-grey-text text-darken-2 ">Bienvenido</h1>
                        <div class="row center">
                            <h3 class="header col s12 light blue-grey-text text-darken-2 ">
                                Celebra con nosotros el XXV Aniversario de las Universidades Tecnológicas de México.
                            </h3>
                            <h4>
                                La carrera atlética de 25 años por las Universidades Tecnológicas de México.
                            </h4>
                        </div>
                        <div class="row center">
                            <!-- Modal Trigger -->
                          <a href="#modal1" id="download-button" class="btn-large waves-effect waves-light teal lighten-1 modal-trigger">Registrarme</a>
                        </div>
                        <!-- Modal Structure -->
                        <div id="modal1" class="modal">
                            <div class="modal-content">
                                <h4 class="header center blue-grey-text text-darken-2">¡Upsss...!</h4>
                                <p style="display: inherit; font-size: 24px; font-weight: bolder;" class="header center teal-text text-darken-2">
                                    Para realizar este proceso es necesario acudir a la Universidad Tecnológica del Sur del Estado de México
                                </p>
                                <h4 class="header center center blue-grey-text text-darken-2">
                                    <b>Nota: </b>Acudir con alguna identificación con fotografía
                                </h4>
                            </div>
                            <div class="modal-footer">
                                <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Entiendo</a>
                            </div>
                        </div>
                        <br><br>
                    </div>
                </div>
                <div class="parallax"><img src="imgs/background1.jpg" alt="Unsplashed background img 1"></div>
            </div>


            <div class="container">
                <div class="section">
                    <!--   Icon Section   -->
                    <div class="row">
                        <div class="col s12">
                            <h1 class="header center teal-text text-darken-2">
                                LA UTSEM TE INVITA A PARTICIPAR EN...
                            </h1>
                            <span class="blue-grey-text text-darken-2" style="font-size: 26px; font-weight: bolder;">
                                En el Marco de las Celebraciones del XXV Aniversario del Subsistema de Universidades Tecnológicas
                            </span>
                            <h4 class="center teal-text text-darken-2" style="font-size: 26px; font-weight: bolder;">
                                La 1ª carrera "Corre por la Educación"
                            </h4>
                        </div>
                        <div class="col s12 m4">
                            <div class="icon-block">
                                <h2 class="center teal-text"><i class="material-icons">flash_on</i></h2>            
                                <h1 class="header center blue-grey-text text-darken-2 ">Fecha</h1>
                                <span style="display: inherit; font-size: 60px; font-weight: bolder;" class="header center teal-text text-darken-2">Domingo</span>
                                <span style="display: inherit; font-size: 60px; font-weight: bolder;" class="header center teal-text text-darken-2">19</span>
                                <span style="display: inherit; font-size: 40px; font-weight: bolder;" class="header center teal-text text-darken-2">de Junio</span>
                                <span style="display: inherit; font-size: 65px; font-weight: bolder;" class="header center teal-text text-darken-2">Ya solo faltan</span>
                            </div>
                        </div>

                        <div class="col s12 m4">
                            <div class="icon-block">
                                <h2 class="center teal-text"><i class="material-icons">group</i></h2>
                                <h1 class="header center blue-grey-text text-darken-2">Datos</h1>

                                <ul class="">
                                    <li class="collection-item avatar">
                                        <i class="material-icons teal-text" style="font-size: 26px">grade</i>
                                        <span class="title blue-grey-text text-darken-2" style="font-size: 26px; font-weight: bolder;">Inicio</span>
                                        <div class="title blue-grey-text text-darken-2" style="padding-left: 41px; font-size: 15px; font-weight: bolder;">Unidad Deportiva de Tejupilco</div>
                                    </li>
                                    <li class="collection-item avatar">
                                       <i class="material-icons teal-text" style="font-size: 26px">grade</i>
                                        <span class="title blue-grey-text text-darken-2" style="font-size: 26px; font-weight: bolder;">Hora de salida</span>
                                        <div class="title blue-grey-text text-darken-2" style="padding-left: 41px; font-size: 15px; font-weight: bolder;">7:30 a.m</div>
                                    </li>
                                    <li class="collection-item avatar">
                                        <i class="material-icons teal-text" style="font-size: 26px">grade</i>
                                        <span class="title blue-grey-text text-darken-2" style="font-size: 26px; font-weight: bolder;">Kilómetros</span>
                                        <div class="title blue-grey-text text-darken-2" style="padding-left: 41px; font-size: 15px; font-weight: bolder;">5 Km</div>
                                    </li>
                                    <li class="collection-item avatar">
                                        <i class="material-icons teal-text" style="font-size: 26px">grade</i>
                                        <span class="title blue-grey-text text-darken-2" style="font-size: 26px; font-weight: bolder;">Cupo</span>
                                        <div class="title blue-grey-text text-darken-2" style="padding-left: 41px; font-size: 15px; font-weight: bolder;">Limitado a 700 corredores</div>
                                    </li>
                                    <li class="collection-item avatar">
                                        <i class="material-icons teal-text" style="font-size: 26px">grade</i>
                                        <span class="title blue-grey-text text-darken-2" style="font-size: 26px; font-weight: bolder;">Categoría</span>
                                        <div class="title blue-grey-text text-darken-2" style="padding-left: 41px; font-size: 15px; font-weight: bolder;">Libre</div>
                                    </li>
                                    <li class="collection-item avatar">
                                        <i class="material-icons teal-text" style="font-size: 26px">grade</i>
                                        <span class="title blue-grey-text text-darken-2" style="font-size: 26px; font-weight: bolder;">Rama</span>
                                        <div class="title blue-grey-text text-darken-2" style="padding-left: 41px; font-size: 15px; font-weight: bolder;">Femenil y Varonil</div>
                                    </li>
                                    <li class="collection-item avatar">
                                        <i class="material-icons teal-text" style="font-size: 26px">grade</i>
                                        <a href="#croquis" class="modal-trigger">
                                            <span class="title" style="font-size: 26px; font-weight: bolder;">Croquis</span>
                                        </a>
                                    </li>
                                </ul>
                                <!-- Modal Structure -->
                                <div id="croquis" class="modal">
                                    <div class="modal-content">
                                        <div class="card">
                                            <div class="waves-effect waves-block waves-light" style="text-align: center">
                                                <img class="activator" src="imgs/croquis.png" style="width: 65%" alt="croquis">
                                            </div>
                                            <div class="card-content">
                                                <span class="card-title activator teal-text text-darken-2">Croquis de recorrido<i class="material-icons right">more_vert</i></span>
                                            </div>
                                            <div class="card-reveal">
                                                <span class="card-title teal-text text-darken-2">Croquis de recorrido<i class="material-icons right">close</i></span>
                                                <p>Inicio: Unidad Deportiva de Tejupilco</p>
                                                <p>Meta: Precidencia Municipal</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Ir atras</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col s12 m4">
                            <div class="icon-block">
                                  <h2 class="center teal-text"><i class="material-icons">settings</i></h2>
                                  <h1 class="header center blue-grey-text text-darken-2">Por</h1>
                                  <img style="margin-left: 19%;" src="imgs/logout.png"  alt="logo"/>             
                            </div>
                        </div>
                        <div class="col s12">
                            <span style="display: inherit; font-size: 40px; font-weight: bolder;" class="header center teal-text text-darken-2">
                                  <span id="contador"></span>
                            </span>
                        </div>
                        <div class="col s12">
                            <h1 class="header center blue-grey-text text-darken-2">
                               PREMIOS
                            </h1>
                        </div>
                        <div class="col s12 m4">
                            <div class="icon-block">
                                <h2 class="center teal-text"><img src="imgs/trophy.png" style="width: 80px" alt="trophy"/></h2>
                                <h1 class="header center blue-grey-text text-darken-2">1er Lugar</h1>     
                            </div>
                        </div>
                        <div class="col s12 m4">
                            <div class="icon-block">
                                  <h2 class="center teal-text"><img src="imgs/trophy.png" style="width: 80px" alt="trophy"/></h2>
                                  <h1 class="header center blue-grey-text text-darken-2">2do Lugar</h1>          
                            </div>
                        </div>
                        <div class="col s12 m4">
                            <div class="icon-block">
                                  <h2 class="center teal-text"><img src="imgs/trophy.png" style="width: 80px" alt="trophy"/></h2>
                                  <h1 class="header center blue-grey-text text-darken-2">3er Lugar</h1>        
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="parallax-container valign-wrapper">
                <div class="section ">
                    <div class="container">
                        <div class="row center">
                            <img src="imgs/Logotipo-UTSEM-white.png" style="width: 50%" alt="logo" /> 
                        </div>
                    </div>
                </div>
                <div class="parallax"><img src="imgs/background2.jpg" alt="Unsplashed background img 2"></div>
            </div>

            <div class="container">
                <div class="section">

                    <div class="row">
                        <div class="col s12 center">
                            <h3><i class="mdi-content-send brown-text"></i></h3>
                            <h1 class="header center blue-grey-text text-darken-2 ">Informes aquí</h1>
                            <div class="section">
                                <!--   Icon Section   -->
                                <div class="row">
                                    <div class="col s12 m4">
                                        <a href="https://www.facebook.com/utsemtejupilco" target="blanck">
                                            <div class="icon-block">
                                                <img src="imgs/facebook.png" alt="Facebook" />
                                                <h5 class="center">Facebook</h5>
                                                <h6 class="center">Utsem Tejupilco</h6>
                                            </div>
                                        </a>
                                    </div>

                                    <div class="col s12 m4">
                                        <a href="https://twitter.com/utsemtejupilco" target="blanck">
                                            <div class="icon-block">
                                                <img src="imgs/twiter.png" alt="Twitter" />
                                                <h5 class="center">Twitter</h5>
                                                <h6 class="center">#SoyUtsem</h6>
                                            </div>
                                        </a>
                                    </div>

                                    <div class="col s12 m4">
                                        <div class="icon-block">
                                            <a href="#">
                                                <img src="imgs/telephone.png" alt="Telefonos" />
                                                <h5 class="center">Teléfonos</h5>
                                            </a>
                                            <p class="left-align light" style="font-size: 14px">(01724)-269-40-16 al 22 Ext. 230 y 225</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="parallax-container valign-wrapper">
                <div class="section no-pad-bot">
                    <div class="container">
                        <div class="row center">
                        </div>
                    </div>
                </div>
                <div class="parallax"><img src="imgs/background3.jpg" alt="Unsplashed background img 3"></div>
            </div>

            <footer class="page-footer teal teal darken-4">
                <div class="container">
                    <div class="row">
                        <div class="white-text text-darken-2">
                            <table border="0" width="100%">
                                <tbody>
                                    <tr>
                                        <td align="right" valign="middle" width="48%" style="text-align: right;">Gobierno del Estado de México<br>
                                            Secretaría de Educación<br>
                                            Universidad Tecnológica del Sur del Estado de México
                                        </td>
                                        <td width="1%">&nbsp;</td>
                                        <td align="left" valign="middle" width="50%">Carretera Tejupilco - Amatepec Km. 12 SN Localidad de San Miguel
                                            Ixtapan, Tejupilco, Estado de México, C.P 51426 <br>
                                            Teléfonos: (01724)-269-40-16 al 22 Ext. 230 y 225<br>
                                            E-mail: utsem.difusion@utsem.edu.mx Y culturaydeporte@utsem.edu.mx
                                        </td>
                                    </tr>
                                </tbody>
                          </table>
                        </div>
                    </div>
                </div>
                <div class="footer-copyright teal darken-1">
                  <div class="container">
                    Creado por <a class="brown-text text-lighten-3" href="http://www.utsem.edu.mx/ut/">Universidad Tecnológica del Sur del Estado de México</a>
                  </div>
                </div>
            </footer>
            <!--  Scripts-->
            <script src="js/code.jquery.com_jquery-2.1.1.min.js" type="text/javascript"></script>
            <script src="js/materialize.js"></script>
            <script src="js/init.js"></script>
            <script src="js/index.js" type="text/javascript"></script>
            <script>
                $(document).ready(function(){
                    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                    $('.modal-trigger').leanModal();
                });
            </script>
            <script type="text/javascript">
                function countdown(id){
                    var fecha=new Date('2016','05','19','07','00','00');
                    var hoy=new Date();
                    var dias=0;
                    var horas=0;
                    var minutos=0;
                    var segundos=0;

                    if (fecha>hoy){
                        var diferencia=(fecha.getTime()-hoy.getTime())/1000;
                        dias=Math.floor(diferencia/86400);
                        diferencia=diferencia-(86400*dias);
                        horas=Math.floor(diferencia/3600);
                        diferencia=diferencia-(3600*horas);
                        minutos=Math.floor(diferencia/60);
                        diferencia=diferencia-(60*minutos);
                        segundos=Math.floor(diferencia);

                        $(id).html('<span class="element">' + dias + ' días </span><span class="element">' + horas + ' horas </span><span class="element">' + minutos + ' minutos </span><span class="element">' + segundos + ' segundos...</span>');

                        if (dias>0 || horas>0 || minutos>0 || segundos>0){
                                setTimeout("countdown('"+id+"')",1000);
                        }
                    }
                    else{
                        $(id).html('<span class="element">' + dias + ' días</span><span class="element">' + horas + ' horas</span><span class="element">' + minutos + ' minutos</span><span class="element">' + segundos + ' segundos...</span>');
                    }
                }
                $(window).load(function(){
                        countdown('#contador');
                });           
            </script>
        </body>
    </html>
<%}else{
    response.sendRedirect("/carrera-atletica/onlyAuthorizedAccess/");
}%>