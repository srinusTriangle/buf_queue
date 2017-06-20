class Queue
	attr_accessor :queue, :size

	# Initializing queue with the given size
	def initialize(size)
		@queue = []
		@size = size
	end

	# adding an item to queue
	def add(val)
		@queue << val
	end

	# Is Q is full with the allocated size
	def max_queue_size_reached
		@queue.length == @size
	end
end