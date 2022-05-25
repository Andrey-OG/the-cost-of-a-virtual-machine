require_relative "report_vm_max_capacity"

class PresentVmMaxCapacity
  def self.present(report)
    puts "ID, Stats"
    report.each do |line|
      print "#{ line[:id] }" 
      line[:stats].each_pair { |key, value| print ", #{ key } = #{ value }" }
      puts
    end
  end
end

PresentVmMaxCapacity.present(ReportVmMaxCapacity.report(ARGV[0].to_i, ARGV[1]))
