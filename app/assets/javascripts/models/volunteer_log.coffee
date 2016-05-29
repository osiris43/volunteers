class DashboardApp.Models.VolunteerLog extends Backbone.Model

  
	initialize: (options) ->
		#console.log("model initialized")

	toJSON: () ->
		return {"volunteer_activity": _.clone(@.attributes)}

  save: ->
		response = Backbone.sync('create', @, url: @url(), contentType: 'application/json', data: JSON.stringify(children: @toJSON()))
		response.done () =>
			console.log("saved to the server!")
