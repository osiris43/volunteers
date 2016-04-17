class DashboardApp.Views.ShowHoursView extends Backbone.View
	el: "#viewHoursContainer"

	template: HandlebarsTemplates["hours/show"]
	
	initialize: (options) -> 
		_.bindAll(@, "render", "addAll")
		@collection.bind("reset", @addAll)
		@.listenTo(@collection, 'sync', @hoursSaved)
		console.log("View Hours initialize")
	
	render: -> 
		console.log("rendering add hours view")
		console.log(@collection.toJSON())
		@$el.html @template(loggedHours: @collection.toJSON())
		@

	addAll: ->
		@.render()

	hoursSaved: ->
		console.log("add to the view here")
		@.render()
