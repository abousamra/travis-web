`import Ember from 'ember'`

Location = Ember.HistoryLocation.extend
  getURL: ->
    location = @get('location')
    location.pathname + location.hash

`export default Location`
