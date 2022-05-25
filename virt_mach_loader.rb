require "csv"
require_relative "virt_mach"

class VirtMachLoader
  DATA = []
	CSV.foreach('vms.csv') do |row|
    id = row[0].to_i
    cpu = row[1].to_i
    ram = row[2].to_i
    hdd_type = row[3]
    hdd_capacity = row[4].to_i
		DATA.push(VirtMach.new(id, cpu, ram, hdd_type, hdd_capacity))
	end

  def self.find_by_id(id)
    DATA.find { |vm| vm.id == id }
  end
end