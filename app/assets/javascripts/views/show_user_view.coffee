class DashboardApp.Views.ShowUserView extends Backbone.View
  el: "#monthlyChart"
  template: HandlebarsTemplates["users/show"]
  
  plotOptions: 
    yaxis: {},
    xaxis:  
      mode : "time", 
      timeformat: "%b",  
      ticks: [[1, "Jan"], [2, "Feb"], [3, "Mar"], [4, "Apr"], [5, "May"], [6, "Jun"], [7, "Jul"], [8, "Aug"], [9, "Sep"], [10, "Oct"], [11, "Nov"], [12, "Dec"]]
    legend: { show: true, container: '.legend' },
    grid: { hoverable: true, clickable: true, autoHighlight: true }

  initialize: (options) -> 
    @.render()

  render: -> 
    options = _.clone(@plotOptions)
    series = [ [[1, 0], [2, 4 ],[3,5]] ]
    @$el.html @template()
    $.plot(@$('#yearlyHoursGraph'), series, options )
    @
