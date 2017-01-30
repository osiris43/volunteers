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

window.UserApp = 
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}

	initialize: (hoursHistory) ->
		@showview = new DashboardApp.Views.ShowUserView({history: hoursHistory})

$(document).ready ->
	$('.phone_us').mask('(000) 000-0000')

$(document).ready -> 
	$('.dob_field').mask('00/00/0000')



