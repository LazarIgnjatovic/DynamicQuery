$(document).ready(init())
var ind;

$.postJSON = function(url, data, callback) {
    return jQuery.ajax({
    headers: { 
        'Accept': 'application/json',
        'Content-Type': 'application/json' 
    },
    type: 'POST',
    url: url,
    data: JSON.stringify(data),
    dataType: 'JSON',
    success: callback
    });
};

function init()
{
    reqDBInfo()
    $('#sel_fields').select2({
        width:'resolve'
    });
    $('#group_fields').select2({
        width:'resolve'
    });
    $('#sort_fields').select2({
        width:'resolve'
    });

    whereSetup()
}

function whereSetup()
{
    ind=0;
    console.log(ind);
    jQuery('<div>', {
        id: 'cond_'+ind,
        class: 'condition.initial',
    }).appendTo('#where');
    

    $("#cond_"+ind).append('<select id="field_'+ind+'" name="field_'+ind+'" style="width: 15%"></select>')
    $("#cond_"+ind).append('<label> IN </label')
    $("#cond_"+ind).append('<select class="select2" id="input_'+ind+'" name="input_'+ind+'" multiple="multiple" style="width: 30%"></select>')
    $("#cond_"+ind).append('<button id="btn_add_'+ind+'" name="btn_add_'+ind+'" > Add </button>')
    $("#cond_"+ind).append('<button id="btn_rm_'+ind+'" name="btn_rm_'+ind+'"> Remove </button>')
    $("#cond_"+ind).append('</br>')
    
    $('#input_'+ind).select2({
        width:'resolve'
    });

    $("#field_"+ind).change(function(e){
        fieldSelected($("#"+e.target.id).val());
    })
    
    $("#btn_add_"+ind).click(function() {
        addCondition();
    });
    $("#btn_rm_"+ind).click(function() {
        removeCond();
    });

    ind++

    function fieldSelected(opt)
    {
        console.log(opt);
    }

    function addCondition()
    {
        jQuery('<div>', {
            id: 'cond_'+ind,
            class: 'condition.initial',
        }).appendTo('#where');

        $("#cond_"+ind).append('<select id="field_'+ind+'" name="field_'+ind+'" style="width: 15%"></select>')
        $("#cond_"+ind).append('<label> IN </label')
        $("#cond_"+ind).append('<select class="select2" id="input_'+ind+'" name="input_'+ind+'" multiple="multiple" style="width: 30%"></select>')
        
        $('#input_'+ind).select2({
            width:'resolve'
        });
        console.log(ind);
        ind++
    }

    function removeCond()
    {
        if(ind>0)
        {
            ind--;
            $("#cond_"+ind).detach();
        }
    }
    

}

function checkTable()
{
    $('#sel_fields').empty();
    $('#group_fields').empty();
    $('#sort_fields').empty();
        $('input[name=tables]:checked').each(function () {
            $.get('http://localhost:5000/DB/fieldsFrom/'+$(this).val(), function (data, textStatus, jqXHR) {
                data.forEach(element => {
                    var newOption = new Option(element, element, false, false);
                    var newOption1 = new Option(element, element, false, false);
                    var newOption2 = new Option(element, element, false, false);
                    $('#sel_fields').append(newOption).trigger('change');
                    $('#group_fields').append(newOption1).trigger('change');
                    $('#sort_fields').append(newOption2).trigger('change');

                    for(i=0;i<ind;i++)
                    {
                        $('#field_'+i).append($('<option>', {
                            value: element,
                            text: element
                        }));
                    }
                });
            });
        });
}

function reqDBInfo()
{
    $.get('http://localhost:5000/DB/tables', function (data, textStatus, jqXHR) {
        data.forEach(element => {
            $('#from').append('<input type="checkbox" onclick=checkTable() id="chk_'+ element +'" name="tables" value='+ element +' /> ' + element + '<br />')
        });
    });
}

function setFields()
{
    var $selected=$('input[name=tables]:checked')
    console.log($selected);
}

function query()
{
    var selectedFields=$('#sel_fields').select2('val')
    var groupFields=$('#group_fields').select2('val')
    var orderFields=$('#sort_fields').select2('val')
    var isAscending=$('#chk_asc').is(':checked');
    $.postJSON('http://localhost:5000/DB/query',   // url
       {selectedFields,groupFields,orderFields,isAscending}, // data to be submit
       function(data, status, jqXHR) {// success callback
                console.log(data);
        });
    
}

