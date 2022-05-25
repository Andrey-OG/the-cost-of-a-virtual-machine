require_relative "virt_mach_loader"
require_relative "volumes_loader"

class AllStats
  DATA = {}
  count_vms = VirtMachLoader::DATA.count
  for i in 0...count_vms
    vm = VirtMachLoader.find_by_id(i)
    volumes = VolumesLoader.find_all_by_id(i)

    DATA.store(i, { "cpu" =>  vm.cpu, "ram" =>  vm.ram, "sata" => 0, "sas" => 0, "ssd" => 0})
    DATA[i][vm.hdd_type] += vm.hdd_capacity

    if volumes == nil
      0
    else
      volumes.each {|volume| DATA[i][volume.type] += volume.capacity }
    end
  end
end