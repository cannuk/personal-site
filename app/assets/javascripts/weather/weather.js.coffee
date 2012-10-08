#= require init
#= require shared/yql_model
#= require ./init
class sdn.weather.Weather extends sdn.YQLModel
  urlRoot: "http://query.yahooapis.com/v1/public/yql?q=select%20wind%2C%20astronomy%2C%20item.condition.code%2C%20item.condition.temp%2C%20item.condition.text%20%20%20from%20weather.forecast%20where%20location%3D%2294105%22&format=json&callback=?"

