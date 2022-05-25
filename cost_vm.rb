require_relative "price_loader"
require_relative "virt_mach_loader"

class CostVM
  attr_accessor :vm
  def initialize(vm)
    @vm = vm
    
  end

	def cost
    vm.hdd_capacity * price_hdd + vm.ram * price_ram + vm.cpu * price_cpu
  end

  def price_ram
    PriceLoader.find_by_type("ram").price
  end

  def price_cpu
    PriceLoader.find_by_type("cpu").price
  end

  def price_hdd
    PriceLoader.find_by_type(vm.hdd_type).price
  end
end

# puts CostVM.new(VirtMachLoader.find_by_id(0)).cost