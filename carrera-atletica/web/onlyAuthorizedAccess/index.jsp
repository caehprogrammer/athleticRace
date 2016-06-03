<%-- 
    Document   : index
    Created on : 2/06/2016, 02:15:58 PM
    Author     : Lab5-E
--%>
<%
if(session.getAttribute("userNameSystemUser") != null){%>
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
            <link href="../css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
            <link href="../css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

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
                        <li><a class="dropdown-button white-text lighten-5" href="#!" data-activates="dropdown1">PARTICIPANTES<i class="material-icons right">arrow_drop_down</i></a></li>
                        
                        <li><a href="/carrera-atletica/serviceSystemUsers" class="white-text lighten-5">SALIR</a></li>
                    </ul>
                    <!-- Dropdown Structure -->
                    <ul id="dropdown1" class="dropdown-content">
                        <li><a href="#newParticipant" class="modal-trigger">NUEVO</a></li>
                        <li class="divider"></li>
                        <li><a href="#updateParticipant" class="modal-trigger">MODIFICAR</a></li>                        
                    </ul>
                    <ul id="nav-mobile" class="side-nav teal darken-1">
                        <li><a href="/carrera-atletica/serviceSystemUsers" class="white-text lighten-5">SALIR</a></li>
                    </ul>
                    <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
                </div>
            </nav>
            <div>
                <div style="z-index: 1003; display: none; opacity: 0; transform: scaleX(0.7); top: 152.884px;" id="newParticipant" class="modal modal-fixed-footer">
                    <div class="teal darken-1" style="top: 0px; height: 32px; text-align: center">
                        <span class="header center white-text text-darken-2" style="font-size: 18px; font-weight: bolder">Agregar a un nuevo participante</span>
                    </div>  
                    <div id="step-1">
                        <form id="form-new-participant" class="" lang="es" action="#" method="POST">
                            <input type="hidden" name="data_pk_participant" value="0">
                            <div class="modal-content">
                                <div class="row">
                                    <div class="input-field col s4">
                                        <input name="data_name" type="text" class="validate" required="">
                                        <label for="data_name">Nombre *</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input name="data_patern_name" type="text" class="validate" required="">
                                        <label for="data_patern_name">Apellido paterno</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input name="data_matern_name" type="text" class="validate" required="">
                                        <label for="data_matern_name">Apellido materno</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <input name="data_mail" type="email" class="validate">
                                        <label for="data_mail">Email</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input name="data_cell_phone" type="tel" class="validate">
                                        <label for="data_cell_phone">Teléfono Celular</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">       
                                        <input  name="data_date_born" class="datepicker" type="text" required="">
                                        <label for="data_date_born">Fecha de nacimiento *</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <select name="data_gender" required="">
                                            <option value="1" selected>Hombre</option>
                                            <option value="2">Mujer</option>
                                        </select>
                                        <label for="data_gender">Sexo *</label>
                                    </div>
                                </div>
                                <input type="hidden" name="data_age" value="0"/>
                                <div class="row">
                                    <div class="input-field col s4">
                                        <select name="data_distance" required="">
                                            <option value="3">3 Km</option>
                                            <option value="5" selected>5 Km</option>
                                        </select>
                                        <label for="data_distance">Distancia *</label>
                                    </div>
                                    <div class="input-field col s8">
                                        <select name="data_category" required="" class="validate">
                                            <option value="Libre" selected>Libre</option>
                                        </select>
                                        <label for="data_category">Categoria *</label>
                                    </div>
                                </div>       
                                <div class="row">
                                    <div class="input-field col s4">
                                        <input name="data_ticket_number" type="number" maxlength="3" minlength="3" min="0" max="30000" class="validate" required="">
                                        <label for="data_ticket_number">Número de boleto *</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input name="data_competitor_number" placeholder="000" readonly="" type="number" maxlength="3" minlength="3" min="0" max="30000" required="">
                                        <label for="data_competitor_number">Número de competidor *</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <select name="data_size_tshirt" required="">
                                            <option value="grande" selected>Grande</option>
                                            <option value="mediana">Mediana</option>
                                            <option value="chica">Chica</option>
                                            <option value="unitalla">Unitalla</option>
                                        </select>
                                        <label for="data_size_tshirt">Talla de la playera *</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <select name="data_fk_institution" required="">
                                            <option value="1" selected>Universidad Tecnológica del Sur del Estado de México</option>
                                        </select>
                                        <label for="data_fk_institution">Institución *</label>
                                    </div>
                                </div>   
                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea name="data_observations"  class="materialize-textarea" length="120"></textarea>
                                        <label for="data_observations">Observaciones</label>
                                    </div>
                                </div>
                            </div>     

                            <div class="modal-footer teal darken-1">
                                <div class="preloader-wrapper small active loading" style="display: none; width: 27px; height: 27px; margin: 9px; float: left;">
                                    <div class="spinner-layer spinner-yellow-only">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="gap-patch">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>
                                <div id="message" class="center" style="margin-left: 9px; display: inline-block; float: left; margin-top: 7px;"></div> 
                                <button style="padding: 5px" class="modal-action modal-close waves-effect waves-teal btn-flat white  btn waves-effect waves-light" name="action">Cancelar
                                    <i class="material-icons right">replay</i>
                                </button>
                                <button style="margin-right: 10px; padding: 5px" class="waves-effect waves-teal btn-flat white  btn waves-effect waves-light " id="sendNewParticipant" type="submit" >Agregar
                                    <i class="material-icons right">send</i>
                                </button>
                            </div>
                        </form>
                    </div>
                    <div id="step-2" style="display: none">
                        <div class="modal-content">
                            <h1 class="center teal-text text-darken-2">Finalmente...</h1>
                            <div class="card-panel teal">
                                <span class="white-text">
                                    Para terminar con el proceso de inscripción es necesario exportar el acta responsiva para que el participante la firme.
                                </span>
                            </div>
                        </div>                    
                        <div class="modal-footer teal darken-1">
                            <div class="preloader-wrapper small active loading" style="display: none; width: 27px; height: 27px; margin: 9px; float: left;">
                                <div class="spinner-layer spinner-yellow-only">
                                    <div class="circle-clipper left">
                                        <div class="circle"></div>
                                    </div>
                                    <div class="gap-patch">
                                        <div class="circle"></div>
                                    </div>
                                    <div class="circle-clipper right">
                                        <div class="circle"></div>
                                    </div>
                                </div>
                            </div> 
                            <button style="margin-right: 10px; padding: 5px" class="waves-effect waves-teal btn-flat white  btn waves-effect waves-light sendToPDF" type="button" >Exportar a PDF
                                <i class="material-icons right">print</i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div style="z-index: 1003; display: none; opacity: 0; transform: scaleX(0.7); top: 152.884px;" id="updateParticipant" class="modal modal-fixed-footer">
                    <div class="teal darken-1" style="top: 0px; height: 32px; text-align: center">
                        <span class="header center white-text text-darken-2" style="font-size: 18px; font-weight: bolder">Modificar algún participante</span>
                    </div>  
                    <div id="step-1">
                        <form id="form-update-participant" class="" lang="es" action="#" method="POST">
                            <input type="hidden" name="data_pk_participant" value="0">
                            <div class="modal-content">
                                <div class="row">
                                    <div class="input-field col s8">
                                        <input id="data_ticket_number" name="data_ticket_number" type="number" maxlength="3" minlength="3" min="0" max="30000" class="validate" required="">
                                        <label for="data_ticket_number">Número de boleto *</label>
                                        <button  class="waves-effect waves-teal btn-flat teal  btn waves-effect waves-light " id="sendSearchParticipant" type="button" >BUSCAR
                                            <i class="material-icons right">send</i>
                                        </button>
                                    </div>
                                    <div class="input-field col s4" style="display: none">
                                        <input name="data_competitor_number" placeholder="000" readonly="" type="number" maxlength="3" minlength="3" min="0" max="30000" required="">
                                        <label for="data_competitor_number">Número de competidor *</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <li class="divider"></li>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s4">
                                        <input name="data_name" type="text" class="validate" required="">
                                        <label for="data_name">Nombre *</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input name="data_patern_name" type="text" class="validate" required="">
                                        <label for="data_patern_name">Apellido paterno</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input name="data_matern_name" type="text" class="validate" required="">
                                        <label for="data_matern_name">Apellido materno</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <input name="data_mail" type="email" class="validate">
                                        <label for="data_mail">Email</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input name="data_cell_phone" type="tel" class="validate">
                                        <label for="data_cell_phone">Teléfono Celular</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">       
                                        <input  name="data_date_born" class="datepicker" type="text" required="">
                                        <label for="data_date_born">Fecha de nacimiento *</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <select name="data_gender" required="">
                                            <option value="1" selected>Hombre</option>
                                            <option value="2">Mujer</option>
                                        </select>
                                        <label for="data_gender">Sexo *</label>
                                    </div>
                                </div>
                                <input type="hidden" name="data_age" value="0"/>
                                <div class="row">
                                    <div class="input-field col s4">
                                        <select name="data_distance" required="">
                                            <option value="3">3 Km</option>
                                            <option value="5" selected>5 Km</option>
                                        </select>
                                        <label for="data_distance">Distancia *</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <select name="data_category" required="" class="validate">
                                            <option value="Libre" selected>Libre</option>
                                        </select>
                                        <label for="data_category">Categoria *</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <select name="data_size_tshirt" required="">
                                            <option value="grande" selected>Grande</option>
                                            <option value="mediana">Mediana</option>
                                            <option value="chica">Chica</option>
                                            <option value="unitalla">Unitalla</option>
                                        </select>
                                        <label for="data_size_tshirt">Talla de la playera *</label>
                                    </div>
                                </div>     
                                <div class="row">
                                    <div class="input-field col s12">
                                        <select name="data_fk_institution" required="">
                                            <option value="1" selected>Universidad Tecnológica del Sur del Estado de México</option>
                                        </select>
                                        <label for="data_fk_institution">Institución *</label>
                                    </div>
                                </div>   
                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea name="data_observations"  class="materialize-textarea" length="120"></textarea>
                                        <label for="data_observations">Observaciones</label>
                                    </div>
                                </div>
                            </div>     

                            <div class="modal-footer teal darken-1">
                                <div class="preloader-wrapper small active loading" style="display: none; width: 27px; height: 27px; margin: 9px; float: left;">
                                    <div class="spinner-layer spinner-yellow-only">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="gap-patch">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>
                                <div id="message" class="center" style="margin-left: 9px; display: inline-block; float: left; margin-top: 7px;"></div> 
                                <button style="padding: 5px" class="modal-action modal-close waves-effect waves-teal btn-flat white  btn waves-effect waves-light" name="action">Cancelar
                                    <i class="material-icons right">replay</i>
                                </button>
                                <button style="margin-right: 10px; padding: 5px" class="waves-effect waves-teal btn-flat white  btn waves-effect waves-light " id="sendUpdateParticipant" type="submit" >Guardar Cambios
                                    <i class="material-icons right">send</i>
                                </button>
                                <button style="margin-right: 10px; padding: 5px" class="waves-effect waves-teal btn-flat white  btn waves-effect waves-light sendToLastPDF" type="button" >Exportar a PDF
                                    <i class="material-icons right">print</i>
                                </button>
                            </div>
                        </form>
                    </div>
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
                          <a href="../#modal1" id="download-button" class="btn-large waves-effect waves-light teal lighten-1 modal-trigger">Registrarme</a>
                        </div>
                        <!-- Modal Structure -->
                        <div id="modal1" class="modal">
                            <div class="modal-content">
                                <h4 class="header center blue-grey-text text-darken-2">!Upsss...!</h4>
                                <p style="display: inherit; font-size: 24px; font-weight: bolder;" class="header center teal-text text-darken-2">
                                    Para realizar este proceso es necesario acudir a la Universidad Tecnológica del Sur del Estado de México
                                </p>
                                <h4 class="header center center blue-grey-text text-darken-2">
                                    <b>Nota: </b>Acudir con alguna identificación con fotografía
                                </h4>
                            </div>
                            <div class="modal-footer">
                                <a href="../#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Entiendo</a>
                            </div>
                        </div>
                        <br><br>
                    </div>
                </div>
                <div class="parallax"><img src="../imgs/background1.jpg" alt="Unsplashed background img 1"></div>
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
                                        <div class="title blue-grey-text text-darken-2" style="padding-left: 41px; font-size: 15px; font-weight: bolder;">Unidad deportiva de Tejupilco</div>
                                    </li>
                                    <li class="collection-item avatar">
                                       <i class="material-icons teal-text" style="font-size: 26px">grade</i>
                                        <span class="title blue-grey-text text-darken-2" style="font-size: 26px; font-weight: bolder;">Hora de salida</span>
                                        <div class="title blue-grey-text text-darken-2" style="padding-left: 41px; font-size: 15px; font-weight: bolder;">7:00 a.m</div>
                                    </li>
                                    <li class="collection-item avatar">
                                        <i class="material-icons teal-text" style="font-size: 26px">grade</i>
                                        <span class="title blue-grey-text text-darken-2" style="font-size: 26px; font-weight: bolder;">Kilómetros</span>
                                        <div class="title blue-grey-text text-darken-2" style="padding-left: 41px; font-size: 15px; font-weight: bolder;">3 Km & 5 Km</div>
                                    </li>
                                    <li class="collection-item avatar">
                                        <i class="material-icons teal-text" style="font-size: 26px">grade</i>
                                        <span class="title blue-grey-text text-darken-2" style="font-size: 26px; font-weight: bolder;">Cuerpo</span>
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
                                        <a href="../#croquis" class="modal-trigger">
                                            <span class="title" style="font-size: 26px; font-weight: bolder;">Croquis</span>
                                        </a>
                                    </li>
                                </ul>
                                <!-- Modal Structure -->
                                <div id="croquis" class="modal">
                                    <div class="modal-content">
                                        <div class="card">
                                            <div class="waves-effect waves-block waves-light" style="text-align: center">
                                                <img class="activator" src="../imgs/croquis.png" style="width: 65%" alt="croquis">
                                            </div>
                                            <div class="card-content">
                                                <span class="card-title activator teal-text text-darken-2">Croquis de recorrido<i class="material-icons right">more_vert</i></span>
                                            </div>
                                            <div class="card-reveal">
                                                <span class="card-title teal-text text-darken-2">Croquis de recorrido<i class="material-icons right">close</i></span>
                                                <p>Inicio: Unidad deportiva de tejupilco</p>
                                                <p>Meta: Precidencia Municipal</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="../#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Ir atras</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col s12 m4">
                            <div class="icon-block">
                                  <h2 class="center teal-text"><i class="material-icons">settings</i></h2>
                                  <h1 class="header center blue-grey-text text-darken-2">Por</h1>
                                  <img style="margin-left: 19%;" src="../imgs/logout.png"  alt="logo"/>             
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
                                <h2 class="center teal-text"><img src="../imgs/trophy.png" style="width: 80px" alt="trophy"/></h2>
                                <h1 class="header center blue-grey-text text-darken-2">1er Lugar</h1>     
                            </div>
                        </div>
                        <div class="col s12 m4">
                            <div class="icon-block">
                                  <h2 class="center teal-text"><img src="../imgs/trophy.png" style="width: 80px" alt="trophy"/></h2>
                                  <h1 class="header center blue-grey-text text-darken-2">2er Lugar</h1>          
                            </div>
                        </div>
                        <div class="col s12 m4">
                            <div class="icon-block">
                                  <h2 class="center teal-text"><img src="../imgs/trophy.png" style="width: 80px" alt="trophy"/></h2>
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
                            <img src="../imgs/Logotipo-UTSEM-white.png" style="width: 50%" alt="logo" /> 
                        </div>
                    </div>
                </div>
                <div class="parallax"><img src="../imgs/background2.jpg" alt="Unsplashed background img 2"></div>
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
                                                <img src="../imgs/facebook.png" alt="Facebook" />
                                                <h5 class="center">Facebook</h5>
                                                <h6 class="center">Utsem Tejupilco</h6>
                                            </div>
                                        </a>
                                    </div>

                                    <div class="col s12 m4">
                                        <a href="https://twitter.com/utsemtejupilco">
                                            <div class="icon-block">
                                                <img src="../imgs/twiter.png" alt="Twitter" />
                                                <h5 class="center">Twitter</h5>
                                                <h6 class="center">#SoyUtsem</h6>
                                            </div>
                                        </a>
                                    </div>

                                    <div class="col s12 m4">
                                        <div class="icon-block">
                                            <a href="../#">
                                                <img src="../imgs/telephone.png" alt="Telefonos" />
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
                <div class="parallax"><img src="../imgs/background3.jpg" alt="Unsplashed background img 3"></div>
            </div>

            <footer class="page-footer teal teal darken-4">
                <div class="container">
                    <div class="row">
                        <div class="white-text text-darken-2">
                            <table border="0" width="100%">
                                <tbody>
                                    <tr>
                                        <td align="right" valign="middle" width="48%" style="text-align: right;">Gobierno del Estado de México<br>
                                            Secretaria de Educación<br>
                                            Universidad Tecnológica Del Sur Del Estado de México
                                        </td>
                                        <td width="1%">&nbsp;</td>
                                        <td align="left" valign="middle" width="50%">Carretera Tejupilco - Amatepec Km. 12.5 Ex - Hacienda de San Miguel
                                            Ixtapan, Tejupilco, Méx. <br>
                                            Teléfonos: (724) 2694020, ext 220, 225&nbsp;<br>
                                            E-mail:&nbsp; utsem.difusion@utsem.edu.mx
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
            <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
            <script src="../js/materialize.js"></script>
            <script src="../js/init.js"></script>
            <script src="../js/index.js" type="text/javascript"></script>
            <script>
                $(document).ready(function(){
                    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                    $('.modal-trigger').leanModal({
                        dismissible: false
                    });
                    $('.datepicker').pickadate({
                        selectMonths: true, // Creates a dropdown to control month
                        selectYears: 90 // Creates a dropdown of 15 years to control year
                    });
                    $('select').material_select();
      
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

                        $(id).html('<span class="element">' + dias + ' dias </span><span class="element">' + horas + ' horas </span><span class="element">' + minutos + ' minutos </span><span class="element">' + segundos + ' segundos...</span>');

                        if (dias>0 || horas>0 || minutos>0 || segundos>0){
                                setTimeout("countdown('"+id+"')",1000);
                        }
                    }
                    else{
                        $(id).html('<span class="element">' + dias + ' dias</span><span class="element">' + horas + ' horas</span><span class="element">' + minutos + ' minutos</span><span class="element">' + segundos + ' segundos...</span>');
                    }
                }
                $(window).load(function(){
                    countdown('#contador');
                });           
            </script>
        </body>
    </html>
<%}else{
    response.sendRedirect("/carrera-atletica/");
}%>