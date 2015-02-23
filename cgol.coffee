class Conway
  constructor: (@length) ->
    @cells = new Array(@length ** 2)
    @cells = (Math.round(Math.random()) for cell in @cells)
  
  neighbors =  (index) ->
    (cell for cell in [@cells[index - @length - 1], @cells[index - @length], @cells[index - @length + 1], @cells[index - 1], @cells[index + 1], @cells[index + @length - 1], @cells[index + @length], @cells[index + @length + 1]] when cell == 1).length

  alive = (cell, num_neighbors) ->
    if num_neighbors == 3 or(cell and num_neighbors == 2) then 1 else 0

  play: () =>
    while true
      @cells = (alive(cell, neighbors.call(this, i)) for cell, i in @cells)
      ((cell) => console.log(@cells[cell...cell+@length])) cell for cell in @cells by @length

c = new Conway 16
c.play()
