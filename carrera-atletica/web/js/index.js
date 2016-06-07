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
                                $("#message").html("<span  class='chip header center red-text text-darken-2'>El correo electónico ya está en uso<i class='material-icons'>close</i></span>");
                            }else if(data.result.indexOf("for key 'fl_ticket_number'")>=0){
                                $("#message").html("<span  class='chip header center red-text text-darken-2'>El número de boleto ya está en uso<i class='material-icons'>close</i></span>");
                            }else if(data.result.indexOf("for key 'fl_competitor_number'")>=0){
                               $("#message").html("<span  class='chip header center red-text text-darken-2'>El número de competidor ya está en uso<i class='material-icons'>close</i></span>"); 
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
    $("#form-login input").keypress(function (event){
        if(event.which==13){
            setTimeout(function (){
                $('#login').openModal();
            },500);
            event.preventDefault();
        }         
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
        console.log(event)
        if(event.which==8 || event.which==0 || (event.which>=48  && event.which<=57) ){
            
        }else{
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
    
    ////////////////////////////////////////////////////////////////////////
    $("a[href='#updateParticipant']").click(function (){
        $("#form-update-participant input[class!='select-dropdown']").each(function (){
            $(this).val("");
        });
        $("#form-update-participant textarea").val("");
        disableField();
    });
    
    function disableField(){
        $("#data_ticket_number").val("");
        $("#form-update-participant input[name!='data_ticket_number']").each(function (){
            $(this).attr("disabled", true); 
        });
        $("#form-update-participant textarea").attr("disabled", true); 
        $("#sendUpdateParticipant").attr("disabled", true); 
        $(".sendToLastPDF").attr("disabled", true); 
    }   
    
    $("#sendSearchParticipant").click(function (){
        var competitor_number = $("#data_ticket_number").val();
        if(competitor_number.length>0){
            $.ajax({
                url: "/carrera-atletica/serviceParticipants?select=one",
                data: { 
                    "pt_competitor_number": competitor_number
                },
                type: 'POST',
                beforeSend: function (xhr) {
                },
                success: function (data, textStatus, jqXHR) {
                    fieldsFillIn(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Error interno del servidor");                
                }
            });
        }else{
            
        }      
    });
    function fieldsFillIn(data){
        var rootData = data[0];
        rootData = rootData["__ENTITIES"];
        rootData = rootData[0];
        console.log(rootData);
        if(rootData){
            console.log(rootData);
            $("#form-update-participant [name='data_name']").val(rootData.getFl_name);
            $("#form-update-participant [name='data_patern_name']").val(rootData.getFl_patern_name);
            $("#form-update-participant [name='data_matern_name']").val(rootData.getFl_matern_name);
            $("#form-update-participant [name='data_mail']").val(rootData.getFl_mail);
            $("#form-update-participant [name='data_cell_phone']").val(rootData.getFl_cell_phone);
            $("#form-update-participant [name='data_date_born']").val(rootData.getFl_date_born);
            $("#form-update-participant [name='data_gender']").parent().children("input").val(rootData.getFl_gender);
            $("#form-update-participant [name='data_distance']").parent().children("input").val(rootData.getFl_distance);
            $("#form-update-participant [name='data_category']").parent().children("input").val(rootData.getFl_category);
            $("#form-update-participant [name='data_size_tshirt']").parent().children("input").val(rootData.getFl_size_tshirt);
            $("#form-update-participant [name='data_fk_institution']").parent().children("input").val(rootData.getFk_institution);
            $("#form-update-participant [name='data_observations']").val(rootData.getFl_observations);
            $(".sendToLastPDF").attr("disabled", false);
        }else{
            $("#form-update-participant input[class!='select-dropdown']").each(function (){
                $(this).val("");
            });
            $("#form-update-participant textarea").val("");
            $(".sendToLastPDF").attr("disabled", true);
            console.log("Row not found");
        }
    }
    
    /////////////////////////////////////////////////////////////////////////////////////
    function loadSource(){
        var url = "/carrera-atletica/serviceParticipants?select=all";
        // prepare the data
        var source = {
            datatype: "json",
            datafields: [
                { name: 'getPk_participant', type: 'int' },
                { name: 'getFl_name', type: 'string' },
                { name: 'getFl_patern_name', type: 'string' },
                { name: 'getFl_matern_name', type: 'string' },
                { name: 'getFl_mail', type: 'string' },
                { name: 'getFl_cell_phone', type: 'string' },
                { name: 'getFl_date_born', type: 'string' },
                { name: 'getFl_age', type: 'string' },
                { name: 'getFl_gender', type: 'string' },
                { name: 'getFl_distance', type: 'string' },
                { name: 'getFl_category', type: 'string' },
                { name: 'getFl_competitor_number', type: 'string' },
                { name: 'getFl_ticket_number', type: 'string' },
                { name: 'getFl_date_register', type: 'string' },
                { name: 'getFl_size_tshirt', type: 'string' },
                { name: 'getFk_institution', type: 'string' },
                { name: 'getFl_observations', type: 'string' },
                { name: 'getFl_tshirt', type: 'bool' }
            ],
            root: "__ENTITIES",
            id: 'getPk_participant',
            url: url,
            updaterow: function (rowid, newdata, commit) {
                // synchronize with the server - send update command
                // call commit with parameter true if the synchronization with the server is successful 
                // and with parameter false if the synchronization failed.
                console.log(newdata);
                $.ajax({
                    async: false,
                    type: "POST",
                    datatype: "json",
                    url: "/carrera-atletica/serviceParticipants?update",
                    data: newdata,
                    beforeSend: function (xhr) {
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("Error interno del servidor");
                    },
                    success: function (data, textStatus, jqXHR) { 
                        $(".loading").fadeOut();
                        if(data.result==="Updated"){
                            commit(true);                       
                        }else{
                            commit(false);   
                        }
                    }
                });
            }
        };
        return source;
    }
    var container = $("<div style='overflow: hidden; position: relative; height: 100%; width: 100%;'></div>");
    var buttonTemplate = "<div style='float: left;'><div style=''></div></div>";
    var addButton = $(buttonTemplate);
    container.append(addButton);
    var renderToolbar = function (toolBar){
        var theme = "";
        var toTheme = function (className) {
            if (theme === "") return className;
            return className + " " + className + "-" + theme;
        };
        toolBar.append(container);
        addButton.jqxButton({cursor: "pointer", enableDefault: true,  height: 30, width: 30 });
        addButton.find('div:first').html("<i class='small material-icons'>insert_chart</i>");
        addButton.jqxTooltip({ position: 'bottom', content: "Exportar Excel"});
        var rowIndex = null;
        $("#tableEntity").on('rowselect', function (event) {
            var args = event.args;
            rowIndex = args.index;
            updateButtons('Select');
        });
        $("#tableEntity").on('rowunselect', function (event) {
            updateButtons('Unselect');
        });
        addButton.off("click");
        addButton.click(function (event) {
            if (!addButton.jqxButton('disabled')) {
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth()+1; //January is 0!

                var yyyy = today.getFullYear();
                if(dd<10){
                    dd='0'+dd;
                } 
                if(mm<10){
                    mm='0'+mm;
                } 
                var today = dd+'-'+mm+'-'+yyyy;
                $("#gridParticipants").jqxGrid('exportdata', 'xls', 'Participantes al '+today);
            }
        });
    };
    function loadGrid(){
        var dataAdapter = new $.jqx.dataAdapter(loadSource());
        $("#gridParticipants").jqxGrid({
            width: "99%",
            height : "70%",
            source: dataAdapter,                
            pageable: true,
            theme : "teal",
            altrows: true,
            localization: getLocalization('es'),
            enabletooltips: true,
            editable: true,
            showtoolbar: true,
            toolbarheight: 40,
            showaggregates: true,
            selectionmode: 'singlecell',
            rendertoolbar: renderToolbar,
            showstatusbar: true,
            statusbarheight: 80,
            pagesize: 15,
            filterable: false,
            sortable: false,
            columns: [
                { text: 'No. Competidor', datafield: 'getFl_competitor_number', width: 120, align: 'center', cellsalign: 'center',
                    aggregates: [
                        {
                            '<b>Total</b>' : function (aggregatedValue, currentValue, column, record){
                                if (currentValue) {
                                    return aggregatedValue + 1;
                                }
                                return aggregatedValue;   
                            }
                        }
                    ]
                },
                { text: 'Nombre', editable: true, datafield: 'getFl_name', width: 150, align: 'center'},
                { text: 'Apellido Paterno', editable: true, datafield: 'getFl_patern_name', width: 150, align: 'center'},
                { text: 'Apellido Materno', editable: true, datafield: 'getFl_matern_name', width: 150, align: 'center' },
                { text: 'Correo Electrónico', editable: true, datafield: 'getFl_mail', width: 230, align: 'center' },
                { text: 'Número Teléfonico', editable: true, datafield: 'getFl_cell_phone', width: 150, align: 'center', cellsalign: 'center'},
                { text: 'Fecha de Nacimiento', editable: false,  datafield: 'getFl_date_born', width: 150, align: 'center', cellsalign: 'center'},
                { text: 'Edad', editable: false, datafield: 'getFl_age', width: 70, align: 'center', cellsalign: 'center'},
                { text: 'Sexo', editable: false, datafield: 'getFl_gender', width: 100, align: 'center', cellsalign: 'left',
                    aggregates: [
                        {
                            '<b>Total</b>' : function (aggregatedValue, currentValue, column, record){
                                if (currentValue) {
                                    return aggregatedValue + 1;
                                }
                                return aggregatedValue;   
                            }
                        },
                        { 'Hombres': function (aggregatedValue, currentValue) {
                                if (currentValue === "Hombre" || currentValue === "HOMBRE") {
                                    return aggregatedValue + 1;
                                }
                                return aggregatedValue;
                            }
                        },
                        { 'Mujeres': function (aggregatedValue, currentValue) {
                                if (currentValue === "Mujer" || currentValue === "MUJER") {
                                    return aggregatedValue + 1;
                                }
                                return aggregatedValue;
                            }
                        }
                    ]
                },
                { text: 'Distancia', editable: false, datafield: 'getFl_distance', width: 100, align: 'center', cellsalign: 'center'},
                { text: 'Categoría', editable: false, datafield: 'getFl_category', width: 100, align: 'center', cellsalign: 'center'},
                { text: 'Fecha de Registro', datafield: 'getFl_date_register', width: 120, align: 'center', cellsalign: 'center'},
                { text: 'Playera', editable: false, datafield: 'getFl_size_tshirt', width: 100, align: 'center', cellsalign: 'left',
                    aggregates: [
                        {
                            '<b>Total</b>' : function (aggregatedValue, currentValue, column, record){
                                if (currentValue) {
                                    return aggregatedValue + 1;
                                }
                                return aggregatedValue;   
                            }
                        },
                        { 'Chica': function (aggregatedValue, currentValue) {
                                if (currentValue === "Chica" || currentValue === "CHICA") {
                                    return aggregatedValue + 1;
                                }
                                return aggregatedValue;
                            }
                        },
                        { 'Mediana': function (aggregatedValue, currentValue) {
                                if (currentValue === "Mediana" || currentValue === "MEDIANA") {
                                    return aggregatedValue + 1;
                                }
                                return aggregatedValue;
                            }
                        },
                        { 'Grande': function (aggregatedValue, currentValue) {
                                if (currentValue === "Grande" || currentValue === "GRANDE") {
                                    return aggregatedValue + 1;
                                }
                                return aggregatedValue;
                            }
                        }
                    ]
                },
                { text: 'Institución', editable: false, datafield: 'getFk_institution', width: 100, align: 'center', cellsalign: 'center'},
                { text: 'Playera Entregada', editable: true, columntype: 'checkbox', datafield: 'getFl_tshirt', width: 150, align: 'center', cellsalign: 'center',
                    aggregates: [
                        {
                            '<b>Total</b>' : function (aggregatedValue, currentValue, column, record){
                                if (currentValue) {
                                    return aggregatedValue + 1;
                                }
                                return aggregatedValue;   
                            }
                        },
                        { 'Entregadas': function (aggregatedValue, currentValue) {
                                if (currentValue) {
                                    return aggregatedValue + 1;
                                }
                                return aggregatedValue;
                            }
                        },
                        { 'No Entregadas': function (aggregatedValue, currentValue) {
                                if (!currentValue) {
                                    return aggregatedValue + 1;
                                }
                                return aggregatedValue;
                            }
                        }
                    ]
                }
            ]
        });
    }
    var applyFilter = function (filtervalue) {
        $("#gridParticipants").jqxGrid('clearfilters');
        var filtertype = 'stringfilter';
        var filtergroup = new $.jqx.filter();
        var filter_or_operator = 1;
        var filtervalue = filtervalue;
        var filtercondition = 'equal';
        var filter = filtergroup.createfilter(filtertype, filtervalue, filtercondition);
        filtergroup.addfilter(filter_or_operator, filter);
        // add the filters.
        $("#gridParticipants").jqxGrid('addfilter', "getFl_competitor_number", filtergroup);
        // apply the filters.
        $("#gridParticipants").jqxGrid('applyfilters');
    };
    function searchInput(){
        var dataAdapter = new $.jqx.dataAdapter(loadSource());
        $("#searchInput").jqxInput({
            theme : "teal",
            source: dataAdapter, 
            placeHolder: "No. Competidor", 
            displayMember: "getFl_competitor_number", 
            valueMember: "getFl_competitor_number", 
            width: 100, 
            height: 25
        });
        $("#searchInput").on('select', function (event) {
            if (event.args) {
                var item = event.args.item;
                if (item) {
                    $("#searchInput").jqxInput({disabled: true});
                    $("#clearButton").jqxButton({ disabled: false });
                    applyFilter(item.label);
                }
            }
        });
        $("#clearButton").jqxButton({ 
            theme : "teal",
            width: 120, 
            height: 28,
            disabled : true
        });
        $("#clearButton").on("click", function (){
            if(!$("#clearButton").jqxButton('disabled')){
                $("#searchInput").jqxInput({disabled: false});
                $("#clearButton").jqxButton({ disabled: true });
                $("#searchInput").val("");
                $("#gridParticipants").jqxGrid('clearfilters');
            }
        });
    }
    $("a[href='#rowsParticipants']").click(function (){
        loadGrid();
        searchInput();
    });
});

