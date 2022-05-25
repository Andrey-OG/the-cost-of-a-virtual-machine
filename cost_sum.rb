require_relative "cost_vm"
require_relative "virt_mach_loader"
require_relative "cost_volume"

class CostSum
  DATA = {}
  count_vms = VirtMachLoader::DATA.count
  for i in 0...count_vms
    cost_vm = CostVM.new(VirtMachLoader.find_by_id(i)).cost
    DATA[i] = cost_vm
    volumes = VolumesLoader.find_all_by_id(i)

    if volumes == nil
      0
    else
      volumes.each {|volume| DATA[i] += CostVolume.new(volume).cost }
    end
  end

  def self.find_by_id(id)
    DATA[id]
  end
end
