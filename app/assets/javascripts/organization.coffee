window.OrganizationApp = 
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}

	initialize: (orgs) ->
		console.log("initializing")
		@collection = new OrganizationApp.Collections.Organizations(orgs)

