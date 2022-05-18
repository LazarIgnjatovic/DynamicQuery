$(document).ready(function () {
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
});