class DashboardApp.Models.VolunteerLog extends Backbone.Model

	url: ->
    "transactions/mark_as_paid"
  
  save: ->
    response = Backbone.sync('create', @, url: @url(), contentType: 'application/json', data: JSON.stringify(children: @toJSON()))
    response.done () =>
      @.set({amount: 0})
