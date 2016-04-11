class DashboardApp.Collections.LoggedHours extends Backbone.Collection
	model: DashboardApp.Models.VolunteerLog

	initialize: (options) ->
		console.log("Logged hours collection")
