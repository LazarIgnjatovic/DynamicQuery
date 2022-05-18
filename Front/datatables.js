$(document).ready(dataSetup())



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

function dataSetup()
{
    $('#example2').DataTable({
        ajax: {
            url: 'http://localhost:5000/DB/alias',
            dataSrc: '',
        },
        columns: [
            { data: 'AliasID' },
            { data: 'TableName' },
            { data: 'TableAbbr' },
            { data: 'TableAlias' },
            { data: 'TableIgnore' },
            { data: 'ColumnName' },
            { data: 'ColumnAlias' },
            { data: 'ColumnIgnore' },
        ],
    });

}

function updateAlias(item)
{
    console.log("update");
    console.log(JSON.stringify({
                Id:item.AliasID,
                TableAbbr:$('#TableAbbr_'+item.AliasID).val(),
                TableAlias:$('#TableAlias_'+item.AliasID).val(),
                TableIgnore:$('#TableIgnore_'+item.AliasID).val(),
                ColumnAlias:$('#ColumnAlias_'+item.AliasID).val(),
                ColumnIgnore:$('#ColumnIgnore_'+item.AliasID).val(),
            }));
    jQuery.ajax({
        headers: { 
            'Accept': 'application/json',
            'Content-Type': 'application/json' 
        },
        type: 'POST',
        url: 'http://localhost:5000/DB/updateAlias',
        data: JSON.stringify({
                Id:item.AliasID,
                TableAbbr:$('#TableAbbr_'+item.AliasID).val(),
                TableAlias:$('#TableAlias_'+item.AliasID).val(),
                TableIgnore:$('#TableIgnore_'+item.AliasID).val(),
                ColumnAlias:$('#ColumnAlias_'+item.AliasID).val(),
                ColumnIgnore:$('#ColumnIgnore_'+item.AliasID).val(),
            }),
        dataType: 'JSON',
        success: function(data, status, jqXHR) {// success callback
            alert('Saved');
        }
        });
}