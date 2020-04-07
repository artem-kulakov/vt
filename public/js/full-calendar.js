$(window).on('load', function() {
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,basicWeek,basicDay'
        },
        defaultDate: new Date,
        defaultView: 'basicDay',
        editable: false,
        droppable: false,
        events: '/records/pizarron.json',
        drop: function() {
            if ($('#drop-remove').is(':checked')) {
                $(this).remove();
            }
        }
    });
});
