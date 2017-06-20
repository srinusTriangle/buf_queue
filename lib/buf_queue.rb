require "buf_queue/version"
require "buf_queue/subscriber"
require "buf_queue/bq"

module BufQueue
	# Number of subscribers
	NUMBER_OF_SUBSCRIBERS = 5
	# Map size - n
	MAP_SIZE = 100
	# Max queue size - but generates the queue size randomly within this range(0-queue_size)
	QUEUE_MAX_SIZE = 5
	# For generating data within range
	RANDOM_INPUT_RANGE = 1000
	
	# Initializing the subscribers with the given size
	def self.initialize_subscribers(bq, number_of_subscribers)
		# Creating subscribers..
		subscribers = []
		(1..number_of_subscribers).each do |i|
			subscribers << Subscriber.new(i)
		end
		bq.add_subscribers subscribers
	end

	# This method is just for generating random type of objects like jsons, strings and integer
	def self.generate_random_type_of_strings(val)
		random = rand(0..2)
		case random
		when 0 #generates JSON obj
			{"key" => val.to_s}
		when 1 #generates string
			val.to_s
		else 			 #send integer value
			val
		end
	end

	# Generating input randomly
	def self.generate_input
		bq = Bq.new
		initialize_subscribers(bq, NUMBER_OF_SUBSCRIBERS)
		i = 0
		begin
			# Iterating over the given map size for enough random input to publish data
			# And also giving the random queue size within the range of QUEUE_MAX_SIZE for changing B value
			while i < MAP_SIZE
				queue_size = rand(1..QUEUE_MAX_SIZE)
				index = rand(0..MAP_SIZE)
				bq.initialize_queue index, queue_size
				bq.add(index, generate_random_type_of_strings(rand(0..RANDOM_INPUT_RANGE)))
				sleep(2)
				i += 1
			end	
		rescue Exception => e
			puts "Exception :: #{e}"
		end
	end
	
end
