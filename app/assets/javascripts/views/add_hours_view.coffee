class DashboardApp.Views.AddHoursView extends Backbone.View
	el: "#addHoursContainer"

	template: JST["hours/create"]

	initialize: (options) -> 
		console.log("Add Hours initialize")

	render: => 
		@$el.html @template()
