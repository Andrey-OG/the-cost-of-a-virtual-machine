require_relative "volumes_count"

class ReportVolumesMaxCount
  def self.report(n)
    VolumesCount::DATA.map { |id, count| { id: id, count: count } }
        .sort_by { |line| line[:count] }
        .last(n)
        .reverse
  end
end
