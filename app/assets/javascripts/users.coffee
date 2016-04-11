window.DashboardApp = 
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}

	initialize: (activities, hours) ->
		console.log("Dashboard app initializing")
		console.log(hours)
		@collection = new DashboardApp.Collections.LoggedHours(hours)
		@view = new DashboardApp.Views.AddHoursView({collection: @collection, activities: activities})

