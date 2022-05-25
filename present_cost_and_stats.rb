require_relative "cost_report"
require_relative "virt_mach_loader"
require_relative "volumes_loader"

class PresentCostAndStats
  def self.add_stats(report)
    puts "ID, Costs"
    report.each do |line|
      vm = VirtMachLoader.find_by_id(line[:id])
      volumes = VolumesLoader.find_all_by_id(line[:id])
      print "#{ line[:id] },#{ line[:cost] }, "
      print "Stats VM: #{ vm.cpu }, #{ vm.ram }, #{ vm.hdd_type }, #{ vm.hdd_capacity }"

      if volumes == nil
        0
      else
        volumes.each { |volume| print ", #{ volume.type }, #{ volume.capacity }"}
      end
      puts
    end
  end
end

PresentCostAndStats.add_stats(CostReport.report(ARGV[0].to_i, ARGV[1]))