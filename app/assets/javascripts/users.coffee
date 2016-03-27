window.DashboardApp = 
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}

	initialize: (activities) ->
		console.log("Dashboard app initializing")
		@collection = new DashboardApp.Collections.LoggedHours()
		@view = new DashboardApp.Views.AddHoursView({collection: @collection, activities: activities})

