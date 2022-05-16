$(document).ready(init())

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
    var sel=$('#sel_fields').select2('val')
    console.log(sel)
    $.postJSON('http://localhost:5000/DB/query',   // url
       sel, // data to be submit
       function(data, status, jqXHR) {// success callback
                console.log(data);
        });
    
/*
    $.ajax({
        type: "POST",
        url: "http://localhost:5000/DB/query",
        data: JSON.stringify({
            selectedFields: sel
        }),
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        success: function(data) {
            if (data.status == 'OK')
                console.log(data);
            else
            alert('Failed adding person: ' + data.status + ', ' + data.errorMessage);
    }});*/
}

