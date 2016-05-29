window.DashboardApp = 
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}

	initialize: (activities, hours, user_id) ->
		@collection = new DashboardApp.Collections.LoggedHours(id: user_id)
		@addview = new DashboardApp.Views.AddHoursView({collection: @collection, activities: activities})
		@showview = new DashboardApp.Views.ShowHoursView({collection: @collection})
		@collection.reset(hours)

