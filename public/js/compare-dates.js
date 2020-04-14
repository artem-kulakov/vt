function compareDates() {
    var startDateString = document.getElementById("startDate").value;
    var startDateParts = startDateString.split("/");
    var startDate = new Date(+startDateParts[2], startDateParts[1] - 1, +startDateParts[0]);

    var endDateString = document.getElementById("endDate").value;
    var endDateParts = endDateString.split("/");
    var endDate = new Date(+endDateParts[2], endDateParts[1] - 1, +endDateParts[0]);

    if(startDate > endDate) {
        (new PNotify({
            title: 'Alert',
            type: 'warning',
            delay: 3000,
            text: "¡La fecha de finalización debe ser posterior a la fecha de inicio!",
            desktop: {
                desktop: true,
                icon: 'assets/images/pnotify/warning.png'
            }
        }));
        document.getElementById("endDate").value = '';
    }
}