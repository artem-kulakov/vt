$(document).ready(function() {
    $('#example').DataTable( {
        "order": [[ 0, "asc" ]],
        "paging": false,
        "searching": false,
        "bInfo" : false
    } );

    $('.table-sortable').DataTable( {
        "order": [[ 0, "asc" ]],
        "paging": false,
        "searching": false,
        "bInfo" : false
    } );
} );
