class DashboardApp.Views.AddHoursView extends Backbone.View
	el: "#addHoursContainer"

	template: HandlebarsTemplates["hours/create"]

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
