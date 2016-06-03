/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function (){
    $("#sendNewParticipant").on("click", function (){                   
        $("#form-new-participant").submit();        
    });
    $("#send").on("click", function (){
        $("#form-login").submit();        
    });
    $("#form-login").on("submit", function (event ){
        if(event.originalEvent){
            $.ajax({
                async: false,
                crossDomain: true,
                type: "POST",
                datatype: "json",
                url: "/carrera-atletica/serviceSystemUsers?selectLogin&&statusLogin=in",
                data: $(this).serialize(),
                beforeSend: function (xhr) {
                    $(".progress").fadeIn();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    $(".progress").fadeOut();
                    alert("Error interno del servidor");
                },
                success: function (data, textStatus, jqXHR) { 
                    $(".progress").fadeOut();
                    if(data.statusLogin==="notExist"){
                        $("#message").html("<span  class='chip header center red-text text-darken-2'>El usuario o la contraseña son incorrectos<i class='material-icons'>close</i></span>");
                        $("#message").show();
                    }else{
                        location.href = "/carrera-atletica/onlyAuthorizedAccess/";
                        $('#login').closeModal();
                    }
                }
            });
        }
        event.preventDefault();
   }); 
   
   $("#form-new-participant").on("submit", function (event){
        if($("input[name='data_date_born']").val().length>0){
            if(event.originalEvent){
                
                $.ajax({
                    async: true,
                    type: "POST",
                    datatype: "json",
                    url: "/carrera-atletica/serviceParticipants?insert",
                    data: $(this).serialize(),
                    beforeSend: function (xhr) {
                        $(".loading").fadeIn();
                        $("#message").hide();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $(".loading").fadeOut();
                        $("#message").hide();
                        alert("Error interno del servidor");
                    },
                    success: function (data, textStatus, jqXHR) { 
                        $("#message").hide();
                        $(".loading").fadeOut();
                        if(data.result==="Inserted"){
                            $('#step-1').fadeOut();
                            $('#step-2').fadeIn();                        
                        }else{
                            if(data.result.indexOf("for key 'fl_mail'")>=0){
                                $("#message").html("<span  class='chip header center red-text text-darken-2'>El correo electónico ya esta en uso<i class='material-icons'>close</i></span>");
                            }else if(data.result.indexOf("for key 'fl_ticket_number'")>=0){
                                $("#message").html("<span  class='chip header center red-text text-darken-2'>El número de boleto ya esta en uso<i class='material-icons'>close</i></span>");
                            }else if(data.result.indexOf("for key 'fl_competitor_number'")>=0){
                               $("#message").html("<span  class='chip header center red-text text-darken-2'>El número de competidor ya esta en uso<i class='material-icons'>close</i></span>"); 
                            }else if(data.result.indexOf("0")>=0){
                                $("#message").html("<span  class='chip header center red-text text-darken-2'>Ocurrió un problema verifica que estén correctos los datos<i class='material-icons'>close</i></span>"); 
                            }
                            $("#message").show();
                        }
                    }
                });
            }
        }else{
             $("#message").html("<span  class='chip header center red-text text-darken-2'>Seleccióna la fecha de nacimiento<i class='material-icons'>close</i></span>"); 
             $("#message").show();
        }  
        
        event.preventDefault();
    }); 
    $("#form-new-participant input, textarea").keypress(function (event){
        if(event.which==13){
            setTimeout(function (){
                $('#newParticipant').openModal();
            },500);
            event.preventDefault();
        }         
    });
    $("input[name='data_ticket_number']").change(function (event){
        $("input[name='data_competitor_number']").val($(this).val());
    });
    $("input[name='data_cell_phone'], input[name='data_ticket_number'], input[name='data_competitor_number']").keypress(function (event){
        var charValue = (event.key);
        var valid = /^[0-9]+$/.test(charValue);
        if(event.which==8 || event.which==0){
            
        }else if (!valid) {
            event.preventDefault();
        }
    });
    $("a[href='#newParticipant']").click(function (){
        $('#step-2').fadeOut();
        $('#step-1').fadeIn(); 
        clearFields();
    });
    $(".sendToPDF").click(function (){
        var competitor_number = $("input[name='data_ticket_number']").val();
        console.log(competitor_number)
        printReport(competitor_number);
    });
    $(".sendToLastPDF").click(function (){
        var competitor_number = $("#data_ticket_number").val();
        printReport(competitor_number);
    });
    function clearFields(){
        $("#form-new-participant input[class!='select-dropdown']").each(function (){
            $(this).val("");
        });
        $("#form-new-participant textarea").val("");
    }
    
    function printReport(competitor_number){
        $.ajax({
            url: "../pdf/index.jsp?sessionResponsive",
            data: { 
                "pt_competitor_number": competitor_number
            },
            type: 'POST',
            beforeSend: function (xhr) {
            },
            success: function (data, textStatus, jqXHR) {
                $('#newParticipant').closeModal();
                $('#updateParticipant').closeModal();
                window.open("../pdf");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("Error interno del servidor");                
            }
        });
    }
});

