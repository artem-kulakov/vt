$(window).on('load', function() {
    var events = $('.full_calendar_events').data('events');
    console.log(events);

    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,basicWeek,basicDay'
        },
        defaultDate: new Date,
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
