#= require ./init


_(@sdn).extend(
  app:
    init: ->
      @weather= new sdn.weather.Weather({})
      @weather.fetch(success: =>@createWeather())
    createWeather: () ->
      new sdn.weather.views.Weather(model: @weather, el: $("#weather_foreground").get(0)).render()
      #new sdn.weather.views.Weather(model: @weather, el: $("#weather_midground").get(0)).render()
      new sdn.weather.views.Weather(model: @weather, ceiling: 100, el: $("#weather_background").get(0)).render()

)
$ =>@sdn.app.init()
