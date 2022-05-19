$(document).ready(dataSetup())

var edited=new Set()

function getAliasTable()
{
    $.get('http://localhost:5000/DB/alias', function (data, textStatus, jqXHR) {
        objects=jQuery.parseJSON(data)
        var tbl_body = document.createElement("tbody");
        var odd_even = false;
        $.each(objects, function() {
            var tbl_row = tbl_body.insertRow();
            tbl_row.className = odd_even ? "odd" : "even";
            var item=this;
            $.each(this, function(k , v) {
                var cell = tbl_row.insertCell();
                if(k=='TableAbbr' || k== 'TableAlias'||k=='TableIgnore'|| k== 'ColumnAlias'||k=='ColumnIgnore')
                {
                    var input=$('<input>').attr({
                        value: v.toString(),
                        type: 'text',
                        id: k+"_"+item.AliasID,
                        name: 'bar'
                    });
                    input.on('change',function(){
                        $("#btn_"+item.AliasID).removeAttr('disabled');
                        console.log(item.AliasID)
                    })
                    
                    input.appendTo(cell);
                }
                else{
                    cell.appendChild(document.createTextNode(v.toString()));
                }
                

            });
            var btnCell = tbl_row.insertCell();
            var btn=$('<input>').attr({
                id: 'btn_'+item.AliasID,
                type: 'button',
                value: 'Save',
                disabled:true
            });
            btn.on('click', function(){
                updateAlias(item);
            });
            btn.appendTo(btnCell);
            odd_even = !odd_even;
            console.log(this);
        });
        $("#alias_table").append(tbl_body);
    });
}

function dataInputChange(id)
{
    edited.add(id);
}

function dataSetup()
{

    $('#example').on( 'click', 'tbody td:not(:first-child)', function (e) {
       
    } );

    var table = $('#example2').DataTable({
        dom: 'Bfrtip',
        ajax: {
            url: 'http://localhost:5000/DB/alias',
            dataSrc: '',
        },
        columns: [
            { data: 'AliasID' },
            { data: 'TableName' },
            { data: null,
                render: function(data, type, row) {
                    return '<input  type="text" placeholder="" value="'+ row.TableAlias +'" id="table_alias'+data.AliasID+'" name="table_Abbr'+data.AliasID+'" onchange="dataInputChange('+ data.AliasID +')" >';
                     } },
            { data: null,
                render: function(data, type, row) {
                    return '<input  type="text" placeholder="" value="'+ row.TableAbbr +'" id="table_abbr'+data.AliasID+'" name="table_Abbr'+data.AliasID+'" onchange="dataInputChange('+ data.AliasID +')" >';
                     } },
            { data: null,
                render: function(data, type, row) {
                    return '<input  type="text" placeholder="" value="'+ row.TableIgnore +'" id="table_ignore'+data.AliasID+'" name="table_Abbr'+data.AliasID+'" onchange="dataInputChange('+ data.AliasID +')" >';
                     } },
            { data: 'ColumnName' },
            { data: null,
                render: function(data, type, row) {
                    return '<input  type="text" placeholder="" value="'+ row.ColumnAlias +'" id="column_alias'+data.AliasID+'" name="table_Abbr'+data.AliasID+'" onchange="dataInputChange('+ data.AliasID +')" >';
                     } },
            { data: null,
                render: function(data, type, row) {
                    return '<input  type="text" placeholder="" value="'+ row.ColumnIgnore +'" id="column_ignore'+data.AliasID+'" name="table_Abbr'+data.AliasID+'" onchange="dataInputChange('+ data.AliasID +')" >';
                     } },
        ],
        select:true,
        buttons: [
            { name: "save", 
                text:"SAVE",
                action: function ( e, dt, node, config ) 
                {
                    bulkSave();
                }
            },
        ]
    });

    table.buttons( 0, null ).containers().appendTo( 'body' );
}

function bulkSave()
{
    for (var it = edited.values(), val= null; val=it.next().value; ) {
        var data=JSON.stringify({
            Id:val.toString(),
            TableAbbr:$('#table_abbr'+val).val(),
            TableAlias:$('#table_alias'+val).val(),
            TableIgnore:$('#table_ignore'+val).val(),
            ColumnAlias:$('#column_alias'+val).val(),
            ColumnIgnore:$('#column_ignore'+val).val(),
        })
        updateAlias(data);
    }
}

function updateAlias(item)
{
    jQuery.ajax({
        headers: { 
            'Accept': 'application/json',
            'Content-Type': 'application/json' 
        },
        type: 'POST',
        url: 'http://localhost:5000/DB/updateAlias',
        data: item,
        dataType: 'JSON',
        complete: function() {// success callback
            alert('Saved');
        }
        });
}