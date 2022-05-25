class CostVirtMachLoader
  DATA = []

  100.times do |i|
    DATA.append(CostVM.new(VirtMachLoader.find_by_id(i))
  end

  def self.find_by_id(id)
    DATA.find { |vm| vm.id == id }
  end
end