require_relative "volumes_capacity"

class ReportVolumesMaxCapacity
  def self.report(n)
    VolumesCapacity::DATA.map { |id, capacity| { id: id, capacity: capacity } }
        .sort_by { |line| line[:capacity] }
        .last(n)
        .reverse
  end
end