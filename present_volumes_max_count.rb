require_relative "report_volumes_max_count"

class PresentVolumesMaxCount
  def self.present(report)
    puts "ID, Count"
    report.each do |line|
      puts "#{ line[:id] }, #{ line[:count] }" 
    end
  end
end

PresentVolumesMaxCount.present(ReportVolumesMaxCount.report(ARGV[0].to_i))