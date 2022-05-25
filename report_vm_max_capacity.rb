require_relative "all_stats"

class ReportVmMaxCapacity
  def self.report(n, type)
    AllStats::DATA.map { |id, stats| { id: id, stats: stats } }
        .sort_by { |line| line[:stats][type] }
        .last(n)
        .reverse
  end
end
