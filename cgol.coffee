_ = require('underscore')

class Conway
  constructor: (@length) ->
    @cells = new Array(@length ** 2)
    _.each @cells, (e, i, l) ->
      e = Math.round(Math.random())
      l[i] = e
  
  neighbors =  (index) =>
    _.compact([@cells[index - @length - 1], @cells[index - @length], @cells[index - @length + 1], @cells[index - 1], @cells[index + 1], @cells[index + @length - 1], @cells[index + @length], @cells[index + @length + 1]]).length

  alive = (cell, num_neighbors) ->
    if num_neighbors == 3 or(cell and num_neighbors == 2) then 1 else 0

  play: () =>
    while true
      _.map @cells, (e, i, l) =>
        n = this.neighbors i
        this.alive e, n

      ((cell) => console.log(@cells[cell...cell+@length])) cell for cell in @cells by @length

c = new Conway 16
c.play()
