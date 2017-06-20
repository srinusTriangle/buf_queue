require 'buf_queue/subject'
require 'buf_queue/queue'
class Bq
	include Subject
	attr_accessor :map
	# Initializing the map and subscribers
	def initialize
		super()
		@map = []
	end

	# Initialize the queue at required index in map with the given queue size
	def initialize_queue(index, queue_size)
		puts "Initializing the queue at #{index} position of map"
		@map[index] = Queue.new(queue_size) if @map[index] == nil
	end

	# add item to the queue which is located at index in map
	def add(index, value)
		queue_obj = @map[index]
		queue_obj.add(value)
		
		# check for the queue size, flush it out if it is full & notify subscribers
		puts "checking the queue size.. #{queue_obj.size} sized Q has #{queue_obj.queue.length} elements"
		if queue_obj.max_queue_size_reached
			puts "Queue at index #{index} is reached max Q size.. notifying subscribers.."
			notify_subscribers(queue_obj.queue)
			flush index, queue_obj.queue.length
		end
	end

	# flush the Q once the size is full..
	def flush(index, size)
		puts "flushing queue.."
		@map[index] = nil
		# initialize_queue(index, size)
		# puts "after flushed out..."
	end
end