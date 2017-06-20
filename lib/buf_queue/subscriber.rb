class Subscriber
	attr_accessor :name

	def initialize(name)
	    puts "initializing subscriber #{name}"
		@name = name
	end
	def update(obj)
		puts "Subscriber#{name} - Received queue..#{obj.to_s}.."
		obj
	end
end