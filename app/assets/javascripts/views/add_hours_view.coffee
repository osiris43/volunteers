class DashboardApp.Views.AddHoursView extends Backbone.View
	el: "#addHoursContainer"

	template: HandlebarsTemplates["hours/create"]

	events: {
		"click #addHours" : "addHours"
	}
	initialize: (options) -> 
		console.log("Add Hours initialize")
		@activities = options.activities
		@.listenTo(@collection, 'sync', @hoursSaved)
		@.listenTo(@collection, 'error', @error)
		@.render()

	render: -> 
		console.log("rendering add hours view")
		@$el.html @template({activities: @activities})


	addHours: (event) ->
		event.preventDefault()
		log = 
			hours: ($("#activityHours").val())
			date: ($("#activityDate").val())
			activity: ($("#activityType").val())


		@collection.create log
		return false
	
	hoursSaved: ->
		console.log("event called")
		$("#addHoursMessage").text("Hours added")
		$("#hoursResult").addClass("alert-success").fadeIn('fast')
		$("#add-hours")[0].reset()

	error: (options) -> 
		console.log("error")
