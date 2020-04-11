$(window).ready(function() {
    $('.d_today').datepicker({
        keyboardNavigation: false,
        forceParse: false,
        todayHighlight: true,
        format: 'dd/mm/yyyy',
        startDate: '-2y',
        endDate: '+2y'
    });
});
