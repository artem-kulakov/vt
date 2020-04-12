$(document).ready(function() {
    var data = $('.chart_data').data('data');


    // Quotations
    var chartDatac = data.quotations;
    var chartc = AmCharts.makeChart("call-chart", {
        "type": "serial",
        "addClassNames": true,
        "defs": {
            "filter": [{
                    "x": "-50%",
                    "y": "-50%",
                    "width": "200%",
                    "height": "200%",
                    "id": "blur",
                    "feGaussianBlur": {
                        "in": "SourceGraphic",
                        "stdDeviation": "30"
                    }
                },
                {
                    "id": "shadow",
                    "x": "-10%",
                    "y": "-10%",
                    "width": "120%",
                    "height": "120%",
                    "feOffset": {
                        "result": "offOut",
                        "in": "SourceAlpha",
                        "dx": "0",
                        "dy": "20"
                    },
                    "feGaussianBlur": {
                        "result": "blurOut",
                        "in": "offOut",
                        "stdDeviation": "10"
                    },
                    "feColorMatrix": {
                        "result": "blurOut",
                        "type": "matrix",
                        "values": "0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .2 0"
                    },
                    "feBlend": {
                        "in": "SourceGraphic",
                        "in2": "blurOut",
                        "mode": "normal"
                    }
                }
            ]
        },
        "fontSize": 12,
        "dataProvider": chartDatac,
        "autoMarginOffset": 0,
        "marginRight": 0,
        "categoryField": "year",
        "categoryAxis": {
            "color": '#fff',
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0,
            "offset": -20,
            "inside": true,
            "parseDates": false,
            "autoGridCount": false,
            "gridCount": 12,
            "minPeriod": "YYYY"
        },
        "valueAxes": [{
            "fontSize": 0,
            "inside": true,
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0,
            "minimum": 0,
        }],
        "chartCursor": {
            "valueLineEnabled": false,
            "valueLineBalloonEnabled": false,
            "cursorAlpha": 0,
            "zoomable": false,
            "valueZoomable": false,
            "cursorColor": "#fff",
            "categoryBalloonColor": "#95ead5",
            "valueLineAlpha": 0
        },
        "graphs": [{
            "id": "g1",
            "type": "line",
            "valueField": "value",
            "fillColors": [
                "#1de9b6",
                "#1dc4e9"
            ],
            "lineAlpha": 0,
            "fillAlphas": 1,
            "showBalloon": true,
            "type": "smoothedLine",
            "balloon": {
                "drop": true,
                "adjustBorderColor": false,
                "color": "#ffffff",
                "fillAlphas": 0.2,
                "bullet": "round",
                "bulletBorderAlpha": 1,
                "bulletSize": 5,
                "hideBulletsCount": 50,
                "lineThickness": 2,
                "useLineColorForBulletBorder": true,
                "valueField": "value",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            },
        }, ],
    });
    setTimeout(function() {
        chartc.zoomToIndexes(1, chartDatac.length - 2);
    }, 400);


    // Line chart options
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


    // Services
    var chartDatad = data.services;
    var chartd = AmCharts.makeChart("services-chart", {
        "type": "serial",
        "addClassNames": true,
        "defs": {
            "filter": [{
                    "x": "-50%",
                    "y": "-50%",
                    "width": "200%",
                    "height": "200%",
                    "id": "blur",
                    "feGaussianBlur": {
                        "in": "SourceGraphic",
                        "stdDeviation": "30"
                    }
                },
                {
                    "id": "shadow",
                    "x": "-10%",
                    "y": "-10%",
                    "width": "120%",
                    "height": "120%",
                    "feOffset": {
                        "result": "offOut",
                        "in": "SourceAlpha",
                        "dx": "0",
                        "dy": "20"
                    },
                    "feGaussianBlur": {
                        "result": "blurOut",
                        "in": "offOut",
                        "stdDeviation": "10"
                    },
                    "feColorMatrix": {
                        "result": "blurOut",
                        "type": "matrix",
                        "values": "0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .2 0"
                    },
                    "feBlend": {
                        "in": "SourceGraphic",
                        "in2": "blurOut",
                        "mode": "normal"
                    }
                }
            ]
        },
        "fontSize": 12,
        "dataProvider": chartDatad,
        "autoMarginOffset": 0,
        "marginRight": 0,
        "categoryField": "year",
        "categoryAxis": {
            "color": '#fff',
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0,
            "offset": -20,
            "inside": true,
            "parseDates": false,
            "autoGridCount": false,
            "gridCount": 12,
            "minPeriod": "YYYY"
        },
        "valueAxes": [{
            "fontSize": 0,
            "inside": true,
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0,
            "minimum": 0,
        }],
        "chartCursor": {
            "valueLineEnabled": false,
            "valueLineBalloonEnabled": false,
            "cursorAlpha": 0,
            "zoomable": false,
            "valueZoomable": false,
            "cursorColor": "#fff",
            "categoryBalloonColor": "#95ead5",
            "valueLineAlpha": 0
        },
        "graphs": [{
            "id": "g1",
            "type": "line",
            "valueField": "value",
            "fillColors": [
                "#1de9b6",
                "#1dc4e9"
            ],
            "lineAlpha": 0,
            "fillAlphas": 1,
            "showBalloon": true,
            "type": "smoothedLine",
            "balloon": {
                "drop": true,
                "adjustBorderColor": false,
                "color": "#ffffff",
                "fillAlphas": 0.2,
                "bullet": "round",
                "bulletBorderAlpha": 1,
                "bulletSize": 5,
                "hideBulletsCount": 50,
                "lineThickness": 2,
                "useLineColorForBulletBorder": true,
                "valueField": "value",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            },
        }, ],
    });
    setTimeout(function() {
        chartd.zoomToIndexes(1, chartDatad.length - 2);
    }, 400);


    // Gastos
    var chart = AmCharts.makeChart("chart-line-1", {
        "type": "serial",
        "theme": "light",
        "marginTop": 10,
        "marginRight": 0,
        "dataProvider": data.receipts,
        "valueAxes": [{
            "axisAlpha": 0,
            "minimum": 0,
            "position": "left"
        }],
        "graphs": [{
            "id": "g1",
            "balloonText": "[[category]]<br><b><span style='font-size:14px;'>[[value]]</span></b>",
            "bullet": "round",
            "bulletBorderAlpha": 2,
            "bulletAlpha": 1,
            "bulletSize": 12,
            "stackable": false,
            "bulletColor": "#fff",
            "bulletBorderColor": "#a389d4",
            "bulletBorderThickness": 3,
            "lineColor": "#a389d4",
            "lineThickness": 2,
            "type": "smoothedLine",
            "valueField": "value",
            "title": "Gastos"
        }],
        "chartCursor": {
            "cursorAlpha": 0,
            "valueLineEnabled": true,
            "valueLineBalloonEnabled": true,
            "valueLineAlpha": 0.5,
            "fullWidth": true
        },
        "categoryField": "year",
        "categoryAxis": {
            "minorGridAlpha": 0,
            "minorGridEnabled": true,
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0
        },
        "legend": {
            "useGraphSettings": true,
            "position": "top"
        },
    });


    // Ingresos
    var chart = AmCharts.makeChart("chart-line-2", {
        "type": "serial",
        "theme": "light",
        "marginTop": 10,
        "marginRight": 0,
        "dataProvider": data.income,
        "valueAxes": [{
            "axisAlpha": 0,
            "minimum": 0,
            "position": "left"
        }],
        "graphs": [{
            "id": "g1",
            "balloonText": "[[category]]<br><b><span style='font-size:14px;'>[[value]]</span></b>",
            "bullet": "round",
            "bulletBorderAlpha": 2,
            "bulletAlpha": 1,
            "bulletSize": 12,
            "stackable": false,
            "bulletColor": "#fff",
            "bulletBorderColor": "#a389d4",
            "bulletBorderThickness": 3,
            "lineColor": "#a389d4",
            "lineThickness": 2,
            "type": "smoothedLine",
            "valueField": "value",
            "title": "Income"
        }],
        "chartCursor": {
            "cursorAlpha": 0,
            "valueLineEnabled": true,
            "valueLineBalloonEnabled": true,
            "valueLineAlpha": 0.5,
            "fullWidth": true
        },
        "categoryField": "year",
        "categoryAxis": {
            "minorGridAlpha": 0,
            "minorGridEnabled": true,
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0
        },
        "legend": {
            "useGraphSettings": true,
            "position": "top"
        },
    });


    // Buses
    var chart = AmCharts.makeChart("line-area2", {
        "type": "serial",
        "theme": "light",
        "marginTop": 10,
        "marginRight": 0,
        "dataProvider": data.buses,
        "valueAxes": [{
            "axisAlpha": 0,
            "position": "left"
        }],
        "graphs": [{
            "id": "g1",
            "balloonText": "[[category]]<br><b><span style='font-size:14px;'>[[value]]</span></b>",
            "bullet": "round",
            "lineColor": "#1de9b6",
            "lineThickness": 3,
            "negativeLineColor": "#1de9b6",
            "valueField": "value"
        }],
        "chartCursor": {
            "cursorAlpha": 0,
            "valueLineEnabled": true,
            "valueLineBalloonEnabled": true,
            "valueLineAlpha": 0.3,
            "fullWidth": true
        },
        "categoryField": "year",
        "categoryAxis": {
            "minorGridAlpha": 0,
            "minorGridEnabled": true,
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0
        },
        "legend": {
            "useGraphSettings": true,
            "position": "top"
        },
    });


    // Quotations created
    var chart = AmCharts.makeChart("line-chart2", {
        "type": "serial",
        "theme": "light",
        "marginTop": 10,
        "marginRight": 0,
        "dataProvider": data.quotations_created,
        "valueAxes": [{
            "axisAlpha": 0,
            "minimum": 0,
            "position": "left"
        }],
        "graphs": [{
            "id": "g1",
            "balloonText": "[[category]]<br><b><span style='font-size:14px;'>[[value]]</span></b>",
            "bullet": "round",
            "bulletBorderAlpha": 2,
            "bulletAlpha": 1,
            "bulletSize": 12,
            "stackable": false,
            "bulletColor": "#fff",
            "bulletBorderColor": "#a389d4",
            "bulletBorderThickness": 3,
            "lineColor": "#a389d4",
            "lineThickness": 2,
            "type": "smoothedLine",
            "valueField": "value",
            "title": "Quotations created"
        }, {
            "id": "g2",
            "balloonText": "[[category]]<br><b><span style='font-size:14px;'>[[value]]</span></b>",
            "bullet": "round",
            "bulletBorderAlpha": 2,
            "bulletAlpha": 1,
            "bulletSize": 12,
            "stackable": false,
            "bulletColor": "#fff",
            "bulletBorderColor": "#1ddcc8",
            "bulletBorderThickness": 3,
            "lineColor": "#1ddcc8",
            "lineThickness": 2,
            "type": "smoothedLine",
            "valueField": "value2",
            "title": "Quotations closed"
        }],
        "chartCursor": {
            "cursorAlpha": 0,
            "valueLineEnabled": true,
            "valueLineBalloonEnabled": true,
            "valueLineAlpha": 0.5,
            "fullWidth": true
        },
        "categoryField": "year",
        "categoryAxis": {
            "minorGridAlpha": 0,
            "minorGridEnabled": true,
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0
        },
        "legend": {
            "useGraphSettings": true,
            "position": "top"
        },
    });


    // Records created
    var chart = AmCharts.makeChart("line-chart3", {
        "type": "serial",
        "theme": "light",
        "marginTop": 10,
        "marginRight": 0,
        "dataProvider": data.records_created,
        "valueAxes": [{
            "axisAlpha": 0,
            "minimum": 0,
            "position": "left"
        }],
        "graphs": [{
            "id": "g1",
            "balloonText": "[[category]]<br><b><span style='font-size:14px;'>[[value]]</span></b>",
            "bullet": "round",
            "bulletBorderAlpha": 2,
            "bulletAlpha": 1,
            "bulletSize": 12,
            "stackable": false,
            "bulletColor": "#fff",
            "bulletBorderColor": "#a389d4",
            "bulletBorderThickness": 3,
            "lineColor": "#a389d4",
            "lineThickness": 2,
            "type": "smoothedLine",
            "valueField": "value",
            "title": "Records created"
        }, {
            "id": "g2",
            "balloonText": "[[category]]<br><b><span style='font-size:14px;'>[[value]]</span></b>",
            "bullet": "round",
            "bulletBorderAlpha": 2,
            "bulletAlpha": 1,
            "bulletSize": 12,
            "stackable": false,
            "bulletColor": "#fff",
            "bulletBorderColor": "#1ddcc8",
            "bulletBorderThickness": 3,
            "lineColor": "#1ddcc8",
            "lineThickness": 2,
            "type": "smoothedLine",
            "valueField": "value2",
            "title": "Records closed"
        }],
        "chartCursor": {
            "cursorAlpha": 0,
            "valueLineEnabled": true,
            "valueLineBalloonEnabled": true,
            "valueLineAlpha": 0.5,
            "fullWidth": true
        },
        "categoryField": "year",
        "categoryAxis": {
            "minorGridAlpha": 0,
            "minorGridEnabled": true,
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0
        },
        "legend": {
            "useGraphSettings": true,
            "position": "top"
        },
    });


    // Quotations status
    var chart = AmCharts.makeChart("bar-chart", {
        "type": "serial",
        "theme": "light",
        "dataProvider": data.quotations_status,
        "valueAxes": [{
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0,
            "fontSize": 0,
        }],
        "startDuration": 1,
        "graphs": [{
            "balloonText": "<b>[[category]]: [[value]]</b>",
            "fillColorsField": "color",
            "fillAlphas": 0.9,
            "lineAlpha": 0,
            "columnWidth": 0.2,
            "type": "column",
            "valueField": "visits"
        }],
        "chartCursor": {
            "categoryBalloonEnabled": false,
            "cursorAlpha": 0,
            "zoomable": false
        },
        "categoryField": "game",
        "categoryAxis": {
            "gridPosition": "start",
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0,
        }
    });


    // Quotations status, week
    var chart = AmCharts.makeChart("bar-chart-2", {
        "type": "serial",
        "theme": "light",
        "dataProvider": data.quotations_status_week,
        "valueAxes": [{
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0,
            "fontSize": 0,
        }],
        "startDuration": 1,
        "graphs": [{
            "balloonText": "<b>[[category]]: [[value]]</b>",
            "fillColorsField": "color",
            "fillAlphas": 0.9,
            "lineAlpha": 0,
            "columnWidth": 0.2,
            "type": "column",
            "valueField": "visits"
        }],
        "chartCursor": {
            "categoryBalloonEnabled": false,
            "cursorAlpha": 0,
            "zoomable": false
        },
        "categoryField": "game",
        "categoryAxis": {
            "gridPosition": "start",
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0,
        }
    });


    // Records status, month
    var chart = AmCharts.makeChart("bar-chart-3", {
        "type": "serial",
        "theme": "light",
        "dataProvider": data.records_status,
        "valueAxes": [{
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0,
            "fontSize": 0,
        }],
        "startDuration": 1,
        "graphs": [{
            "balloonText": "<b>[[category]]: [[value]]</b>",
            "fillColorsField": "color",
            "fillAlphas": 0.9,
            "lineAlpha": 0,
            "columnWidth": 0.2,
            "type": "column",
            "valueField": "visits"
        }],
        "chartCursor": {
            "categoryBalloonEnabled": false,
            "cursorAlpha": 0,
            "zoomable": false
        },
        "categoryField": "game",
        "categoryAxis": {
            "gridPosition": "start",
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0,
        }
    });


    // Records status, month
    var chart = AmCharts.makeChart("bar-chart-4", {
        "type": "serial",
        "theme": "light",
        "dataProvider": data.records_status_week,
        "valueAxes": [{
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0,
            "fontSize": 0,
        }],
        "startDuration": 1,
        "graphs": [{
            "balloonText": "<b>[[category]]: [[value]]</b>",
            "fillColorsField": "color",
            "fillAlphas": 0.9,
            "lineAlpha": 0,
            "columnWidth": 0.2,
            "type": "column",
            "valueField": "visits"
        }],
        "chartCursor": {
            "categoryBalloonEnabled": false,
            "cursorAlpha": 0,
            "zoomable": false
        },
        "categoryField": "game",
        "categoryAxis": {
            "gridPosition": "start",
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0,
        }
    });


    // Revenues
    var chart = AmCharts.makeChart("line-chart4", {
        "type": "serial",
        "theme": "light",
        "marginTop": 10,
        "marginRight": 0,
        "dataProvider": data.income_year,
        "valueAxes": [{
            "axisAlpha": 0,
            "minimum": 0,
            "position": "left"
        }],
        "graphs": [{
            "id": "g1",
            "balloonText": "[[category]]<br><b><span style='font-size:14px;'>[[value]]</span></b>",
            "bullet": "round",
            "bulletBorderAlpha": 2,
            "bulletAlpha": 1,
            "bulletSize": 12,
            "stackable": false,
            "bulletColor": "#fff",
            "bulletBorderColor": "#a389d4",
            "bulletBorderThickness": 3,
            "lineColor": "#a389d4",
            "lineThickness": 2,
            "type": "smoothedLine",
            "valueField": "value",
            "title": "Income"
        }],
        "chartCursor": {
            "cursorAlpha": 0,
            "valueLineEnabled": true,
            "valueLineBalloonEnabled": true,
            "valueLineAlpha": 0.5,
            "fullWidth": true
        },
        "categoryField": "year",
        "categoryAxis": {
            "minorGridAlpha": 0,
            "minorGridEnabled": true,
            "gridAlpha": 0,
            "axisAlpha": 0,
            "lineAlpha": 0
        },
        "legend": {
            "useGraphSettings": true,
            "position": "top"
        },
    });

});