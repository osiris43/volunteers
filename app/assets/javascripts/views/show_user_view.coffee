class DashboardApp.Views.ShowUserView extends Backbone.View
  el: "#monthlyChart"
  template: HandlebarsTemplates["users/show"]
  events: {
    #"plothover #yearlyHoursGraph" : "showTooltip"
  }
  
  plotOptions: 
    yaxis: {},
    xaxis:  
      ticks: [[1, "Jan"], [2, "Feb"], [3, "Mar"], [4, "Apr"], [5, "May"], [6, "Jun"], [7, "Jul"], [8, "Aug"], [9, "Sep"], [10, "Oct"], [11, "Nov"], [12, "Dec"]]
    legend: { show: true, container: '.legend' },
    grid: { hoverable: true, clickable: true, autoHighlight: true },
    tooltip: {
      show: true,
      content: "%y Hours in %x" 
    }

  initialize: (options) -> 
    _.bindAll(@, "showTooltip")
    @history = options.history
    @plotOptions.xaxis.ticks = @history.ticks
    @series = @history.series
    @.render()

  render: -> 
    options = _.clone(@plotOptions)
    console.log(@series)
    @$el.html @template()
    $.plot(@$('#yearlyHoursGraph'), @series, options )
    @

  showTooltip: (evt, pos, item) ->
    console.log("hovered")
