$(document).ready(function() {
    $('#example').DataTable( {
        "order": [[ 0, "asc" ]],
        "paging": false,
        "searching": false,
        "bInfo" : false,
        "columnDefs": [
           { "orderable": false, "targets": [-1,-2] }
        ]
    } );

    $('#example-3').DataTable( {
        "order": [[ 0, "asc" ]],
        "paging": false,
        "searching": false,
        "bInfo" : false,
        "columnDefs": [
           { "orderable": false, "targets": [-1,-2,-3] }
        ]
    } );

    $('#example-0').DataTable( {
        "order": [[ 0, "asc" ]],
        "paging": false,
        "searching": false,
        "bInfo" : false
    } );

    $('.table-sortable').DataTable( {
        "order": [[ 0, "asc" ]],
        "paging": false,
        "searching": false,
        "bInfo" : false,
        "columnDefs": [
           { "orderable": false, "targets": [-1,-2] }
        ]
    } );
} );
