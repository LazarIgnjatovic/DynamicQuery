$(document).ready(init())

function init()
{
    reqDBInfo()
    $('#sel_fields').select2({
        width:'resolve'
    });
    $('#sel_fields').on('select2:opening', function (e){
        $('#sel_fields').empty();
        var $selected=$('input[name=tables]:checked')
        $selected.forEach(element => {
            console.log(element)
        });
    })


}

function reqDBInfo()
{
    $.get('http://localhost:5000/DB/tables', function (data, textStatus, jqXHR) {
        data.forEach(element => {
            $('#from').append('<input type="checkbox" id="chk_'+ element +'" name="tables" value='+ element +' /> ' + element + '<br />')
        });
    });
}

function setFields()
{
    var $selected=$('input[name=tables]:checked')
    console.log($selected);
}

