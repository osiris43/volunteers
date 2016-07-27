class DashboardApp.Views.ShowHoursView extends Backbone.View
	el: "#viewHoursContainer"

	template: HandlebarsTemplates["hours/show"]
	
	initialize: (options) -> 
		_.bindAll(@, "render", "addAll")
		@collection.bind("reset", @addAll)
		@.listenTo(@collection, 'sync', @hoursSaved)
	
	render: -> 
		@$el.html @template(loggedHours: @collection.toJSON())
		@

	addAll: ->
		@.render()

	hoursSaved: (model, collection, options) ->
		table = $('#Hours_table').DataTable()
		node = table.row.add([model.get("date"), model.get("activity_name"), model.get("time")]).draw().node()
		$(node).css('backgroundColor', '#b3ffb3').animate({backgroundColor: 'white'})

