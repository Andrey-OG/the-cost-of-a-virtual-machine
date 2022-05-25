require_relative "volumes_loader"
require_relative "virt_mach_loader"

class VolumesCount
  DATA = {}
  count_vms = VirtMachLoader::DATA.count
  for i in 0...count_vms
    volumes = VolumesLoader.find_all_by_id(i)
    DATA[i] = 0


    if volumes == nil
      0
    else
      volumes.each{ |volume| DATA[i] += 1}
    end
  end
end
