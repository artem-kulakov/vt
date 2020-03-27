$(window).on('load', function() {
    var events = $('.full_calendar_events').data('events');
    console.log(events);

    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        defaultDate: '2018-08-12',
        editable: true,
        droppable: true,
        events: events,
        drop: function() {
            if ($('#drop-remove').is(':checked')) {
                $(this).remove();
            }
        }
    });
});
