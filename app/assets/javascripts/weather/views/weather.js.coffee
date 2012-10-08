#= require init
#= require cloudgen/cloudgen
sdn.weather.views = {}
class sdn.weather.views.Weather extends Backbone.View
  render: () ->
    @width = @$el.width()
    @ceiling = @options.ceiling ? 20
    @height = @$el.height()
    @stage = new Kinetic.Stage(container: @$el.get(0), width: @width)
    @draw()

  createCloud:(height = 3, width = 15, x = 0)->
    size = 25
    cloudCanvas = document.createElement "canvas"
    context = cloudCanvas.getContext("2d")
    grid_x = width
    grid_y = height
    cloudCanvas.width = grid_x * (size+20)
    cloudCanvas.height = grid_y * (size+20)
    grid = (((Math.round(Math.random())) for num in [0..grid_x]) for num in [0..grid_y])
    $cloudgen.drawCloudGroup(context, grid, 40, 40, 25)
    new Kinetic.Image(image: cloudCanvas, x: x, y: (Math.floor(Math.random()*@ceiling)))

  draw: ->
    layer = new Kinetic.Layer()
    @drawCloud(layer, (Math.floor(Math.random()*@width)-40)) for [0..4]
    window.setInterval(=>
      @drawCloud(layer, @width+400)
    , 5000)

  drawCloud: (layer, x) ->
    cloud =  @createCloud(3, 15, x)
    layer.add(cloud)
    @stage.add(layer)
    cloud.transitionTo({
      x: -500,
      duration: 25,
      callback: =>
       cloud.hide()
      })


class sdn.weather.Cloud
  constructor: (options) ->
    @layer = options.layer
    @stage = options.stage

  create:(height = 3, width = 15, x = 0)->
    size = 25
    cloudCanvas = document.createElement "canvas"
    context = cloudCanvas.getContext("2d")
    grid_x = width
    grid_y = height
    cloudCanvas.width = grid_x * (size+20)
    cloudCanvas.height = grid_y * (size+20)
    grid = (((Math.round(Math.random())) for num in [0..grid_x]) for num in [0..grid_y])
    $cloudgen.drawCloudGroup(context, grid, 40, 40, 25)
    new Kinetic.Image(image: cloudCanvas, x: x, y: (Math.floor(Math.random()*@ceiling)))











