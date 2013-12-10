class Computer
	attr_accessor :motherboard, :drives 

	def initialize(motherboard=Motherboard.new, drives=[])
		@motherboard = motherboard
		@drives = drives
	end
end

class Drive
	def initialize(disk_space=100_000)
		@disk_space = disk_space
	end
end

class Motherboard
	attr_accessor :memory, :cpu 

	def initialize(memory=200, cpu = CPU.new)
		@memory = memory
		@cpu = cpu
	end
end

class CPU
end

class ComputerBuilder
	attr_accessor :computer 

	def initialize
		@computer = Computer.new
	end

	def build_motherboard
		@computer.motherboard = Motherboard.new
	end

	def add_memory(memory)
		@computer.motherboard.memory = memory
	end

	def add_cpu(cpu)
		@computer.motherboard.cpu = cpu
	end

	def add_drives(*drives)
		drives.each do |d|
			@computer.drives << d
		end
	end
end

class ComputerDirector
	attr_reader :builder 

	def initialize(builder)
		@builder = builder 
	end

	def execute
		@builder.build_motherboard
		@builder.add_cpu CPU.new
		@builder.add_drives Drive.new(100_000_000), Drive.new(500_000_000)

		@builder.computer
	end
end

computer = ComputerDirector.new(ComputerBuilder.new).execute