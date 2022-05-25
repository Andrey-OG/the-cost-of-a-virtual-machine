class Volume
  attr_accessor :id, :type, :capacity

  def initialize(id, type, capacity)
    @id = id
    @type = type
    @capacity = capacity
  end
end