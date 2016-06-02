/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function (){
    $("#send").on("click", function (){
        if($("#email").text().length>0 && $("#password").text().length>0 ){
            $("#form-login").submit();
        }        
    });
    $("#form-login").on("submit", function (){
        $.ajax({
            async: false,
            crossDomain: true,
            type: "POST",
            datatype: "json",
            url: "http://10.10.10.23/carrera-atletica/serviceSystemUsers?selectLogin&&statusLogin=in",
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
                    location.href = "http://10.10.10.23/carrera-atletica/onlyAuthorizedAccess/";
                    $('#login').closeModal();
                }
            }
        });
        return false;
   }); 
});

