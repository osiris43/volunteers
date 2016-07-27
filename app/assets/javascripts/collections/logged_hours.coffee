class DashboardApp.Collections.LoggedHours extends Backbone.Collection
	

	model: DashboardApp.Models.VolunteerLog

	initialize: (options) ->
		@url = "/users/" + options.id + "/volunteer_activities"

	comparator: (model) ->
		d = new Date(model.get('date'))
		return -d.getTime()
