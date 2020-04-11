function compare()
{
    var startDt = document.getElementById("startDate").value;
    var endDt = document.getElementById("endDate").value;

    if( (new Date(startDt).getTime() > new Date(endDt).getTime()))
    {
        (new PNotify({
            title: 'Alert',
            type: 'warning',
            delay: 3000,
            text: "¡La fecha de finalización debe ser posterior a la fecha de inicio!",
            desktop: {
                desktop: true,
                icon: 'assets/images/pnotify/warning.png'
            }
        })
        );
        document.getElementById("endDate").value = '';
    }
}