function compare()
{
    var startDt = document.getElementById("startDate").value;
    var endDt = document.getElementById("endDate").value;

    if( (new Date(startDt).getTime() > new Date(endDt).getTime()))
    {
        alert("¡La fecha de finalización debe ser posterior a la fecha de inicio!");
        document.getElementById("endDate").value = '';
    }
}