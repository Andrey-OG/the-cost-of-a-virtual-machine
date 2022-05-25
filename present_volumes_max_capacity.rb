require_relative "report_volumes_max_capacity"

class PresentVolumesMaxCapacity
  def self.present(report)
    puts "ID, Capacity"
    report.each do |line|
      puts "#{ line[:id] }, #{ line[:capacity] }" 
    end
  end
end

PresentVolumesMaxCapacity.present(ReportVolumesMaxCapacity.report(ARGV[0].to_i))