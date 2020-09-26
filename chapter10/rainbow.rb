class Rainbow
  include Enumerable

  def each
    yield 'red'
    yield 'blue'
    yield 'yellow'
  end
end
