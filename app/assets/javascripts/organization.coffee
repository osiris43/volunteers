window.OrganizationApp = 
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}

	initialize: (orgs) ->
		@collection = new OrganizationApp.Collections.Organizations(orgs)

