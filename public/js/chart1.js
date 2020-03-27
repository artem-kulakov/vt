$(document).ready(function() {
    var foo = $('.temp_information').data('temp')
    alert(foo);

    var bar = document.getElementById("chart-bar-1").getContext('2d');
    var theme_g1 = bar.createLinearGradient(0, 300, 0, 0);
    theme_g1.addColorStop(0, '#1de9b6');
    theme_g1.addColorStop(1, '#1dc4e9');
    var theme_g2 = bar.createLinearGradient(0, 300, 0, 0);
    theme_g2.addColorStop(0, '#899FD4');
    theme_g2.addColorStop(1, '#A389D4');
    var data1 = {
        labels: [0, 1, 2, 3],
        datasets: [{
            label: "Data 1",
            data: [25, 45, 74, 82],
            borderColor: theme_g1,
            backgroundColor: theme_g1,
            hoverborderColor: theme_g1,
            hoverBackgroundColor: theme_g1,
        }, {
            label: "Data 2",
            data: [30, 52, 65, 65],
            borderColor: theme_g2,
            backgroundColor: theme_g2,
            hoverborderColor: theme_g2,
            hoverBackgroundColor: theme_g2,
        }]
    };
    var myBarChart = new Chart(bar, {
        type: 'bar',
        data: data1,
        options: {
            barValueSpacing: 20
        }
    });
});
