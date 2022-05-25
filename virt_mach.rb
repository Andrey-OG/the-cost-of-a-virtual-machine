class VirtMach
	attr_accessor :id, :cpu, :ram, :hdd_type, :hdd_capacity
	
	def initialize(id, cpu, ram, hdd_type, hdd_capacity)
		@id = id
		@cpu = cpu
		@ram = ram
		@hdd_type = hdd_type
		@hdd_capacity = hdd_capacity
	end
end