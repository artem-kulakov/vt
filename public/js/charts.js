$(document).ready(function() {
    var data = $('.chart_data').data('data');

    const line_chart_options = {
        barValueSpacing: 20,
        scales: {
            xAxes: [{
                ticks: {
                    autoSkip: false,
                    maxRotation: 90,
                    minRotation: 90
                }
            }],
            yAxes: [{
                ticks: {
                    precision: 0,
                    suggestedMin: 0
                }
            }]
        },
        elements: {
            point:{
                radius: 0
            }
        }
    }

    // Cotizaciones
    var bar = document.getElementById("chart-bar-1").getContext('2d');
    var theme_g1 = bar.createLinearGradient(0, 300, 0, 0);
    theme_g1.addColorStop(0, '#1de9b6');
    theme_g1.addColorStop(1, '#1dc4e9');
    var data1 = {
        labels: data.quotations.labels,
        datasets: [{
            label: "Cotizaciones Mensuales",
            data: data.quotations.data,
            borderColor: theme_g1,
            backgroundColor: theme_g1,
            hoverborderColor: theme_g1,
            hoverBackgroundColor: theme_g1,
        }]
    };
    var myBarChart = new Chart(bar, {
        type: 'bar',
        data: data1,
        options: {
            barValueSpacing: 20,
            scales: {
                xAxes: [{
                    ticks: {
                        autoSkip: false,
                        maxRotation: 90,
                        minRotation: 90
                    }
                }],
                yAxes: [{
                    ticks: {
                        precision: 0,
                        suggestedMin: 0
                    }
                }]
            },
            elements: {
                point:{
                    radius: 0
                }
            }
        }
    });


    // Registros
    var bar = document.getElementById("chart-line-1").getContext('2d');
    var data1 = {
        labels: data.records.labels,
        datasets: [{
            label: "Registros Mensuales",
            data: data.records.data,
            fill: false,
            borderWidth: 4,
            borderColor: "#04a9f5",
            backgroundColor: "#04a9f5",
            hoverborderColor: "#04a9f5",
            hoverBackgroundColor: "#04a9f5",
        }]
    };
    var myBarChart = new Chart(bar, {
        type: 'line',
        data: data1,
        responsive: true,
        options: line_chart_options
    });


    // Servicios
    var bar = document.getElementById("chart-line-2").getContext('2d');
    var theme_g2 = bar.createLinearGradient(0, 0, 500, 0);
    theme_g2.addColorStop(0, '#899FD4');
    theme_g2.addColorStop(1, '#A389D4');
    var data1 = {
        labels: data.services.labels,
        datasets: [{
            label: "Servicios Mensuales",
            data: data.services.data,
            fill: false,
            borderWidth: 4,
            borderColor: theme_g2,
            backgroundColor: theme_g2,
            hoverborderColor: theme_g2,
            hoverBackgroundColor: theme_g2
        }]
    };
    var myBarChart = new Chart(bar, {
        type: 'line',
        data: data1,
        responsive: true,
        options: line_chart_options
    });


    // Gastos
    var bar = document.getElementById("chart-line-3").getContext('2d');
    var data1 = {
        labels: data.receipts.labels,
        datasets: [{
            label: "Gastos Mensuales",
            data: data.receipts.data,
            fill: false,
            borderWidth: 4,
            borderColor: theme_g1,
            backgroundColor: theme_g1,
            hoverborderColor: theme_g1,
            hoverBackgroundColor: theme_g1
        }]
    };
    var myBarChart = new Chart(bar, {
        type: 'line',
        data: data1,
        responsive: true,
        options: line_chart_options
    });


    // Ingresos
    var bar = document.getElementById("chart-line-4").getContext('2d');
    var theme_g2 = bar.createLinearGradient(0, 0, 500, 0);
    theme_g2.addColorStop(0, '#899FD4');
    theme_g2.addColorStop(1, '#A389D4');
    var data1 = {
        labels: data.income.labels,
        datasets: [{
            label: "Ingresos Mensuales",
            data: data.income.data,
            fill: false,
            borderWidth: 4,
            borderColor: theme_g2,
            backgroundColor: theme_g2,
            hoverborderColor: theme_g2,
            hoverBackgroundColor: theme_g2
        }]
    };
    var myBarChart = new Chart(bar, {
        type: 'line',
        data: data1,
        responsive: true,
        options: line_chart_options
    });
});