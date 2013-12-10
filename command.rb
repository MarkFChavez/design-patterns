class Button
	def initialize(*commands)
		@commands = commands
	end

	def on_click
		@commands.each { |c| c.execute }
	end
end

#commands
class SaveButton
	def execute
		puts "Saving the document..."
	end
end

class OpenButton
	def execute
		puts "Opening the document..."
	end
end

class RemoveButton
	def execute
		puts "Removing the document..."
	end
end

command_button = Button.new(SaveButton.new, OpenButton.new, RemoveButton.new)
command_button.on_click