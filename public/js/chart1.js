$(document).ready(function() {
    var data = $('.temp_information').data('temp')

    var bar = document.getElementById("chart-bar-1").getContext('2d');
    var theme_g1 = bar.createLinearGradient(0, 300, 0, 0);
    theme_g1.addColorStop(0, '#1de9b6');
    theme_g1.addColorStop(1, '#1dc4e9');
    var theme_g2 = bar.createLinearGradient(0, 300, 0, 0);
    theme_g2.addColorStop(0, '#899FD4');
    theme_g2.addColorStop(1, '#A389D4');
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
});


