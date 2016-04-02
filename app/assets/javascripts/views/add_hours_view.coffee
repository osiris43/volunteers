class DashboardApp.Views.AddHoursView extends Backbone.View
	el: "#addHoursContainer"

	template: HandlebarsTemplates["hours/create"]

	events: {
		"click #addHours" : "addHours"
	}
	initialize: (options) -> 
		@collection.bind("reset", @addAll)
		console.log("Add Hours initialize")
		@activities = options.activities
		console.log(@activities)
		@.render()

	render: -> 
		console.log("rendering add hours view")
		@$el.html @template({activities: @activities})

	addAll: ->
		console.log("adding all hours")

	addHours: ->
		console.log($("#activityHours").val())
		console.log($("#activityDate").val())
		console.log($("#activityType").val())

		log = new VolunteerLog({
			hours: $("#activityHours").val(),
			date: $("#activityDate").val(),
			activity: $("#activityType").val()
		}) 

		log.save()

		return false
