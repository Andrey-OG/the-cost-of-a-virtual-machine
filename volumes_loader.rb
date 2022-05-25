require "csv"
require_relative "volume"

class VolumesLoader
  DATA = []
	CSV.foreach('volumes.csv') do |row|
    id = row[0].to_i
    type = row[1]
    capacity = row[2].to_i
		DATA.push(Volume.new(id, type, capacity))
	end

  def self.find_all_by_id(id)
    DATA.find_all {| volume | volume.id == id }
  end
end