require_relative "price_loader"
require_relative "volumes_loader"

class CostVolume
  attr_accessor :volume
  def initialize(volume)
    @volume = volume
    
  end

	def cost
    volume.capacity * price
  end

  def price
    PriceLoader.find_by_type(volume.type).price
  end
end


# puts CostVolume.new(VolumesLoader.find_by_id(1)).cost