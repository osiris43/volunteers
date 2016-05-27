window.DashboardApp = 
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}

	initialize: (activities, hours) ->
		@collection = new DashboardApp.Collections.LoggedHours()
		@addview = new DashboardApp.Views.AddHoursView({collection: @collection, activities: activities})
		@showview = new DashboardApp.Views.ShowHoursView({collection: @collection})
		@collection.reset(hours)

