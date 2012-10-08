#= require init
class sdn.YQLModel extends Backbone.Model
  sync: (method, model, options) ->
      params = _.extend(
        type: 'GET'
        dataType: 'jsonp'
        url: model.url()
        jsonp: '_callback'
        processData: false
        , options)
      $.ajax(params)

  parse: (response) ->
    response?.query.results.channel



