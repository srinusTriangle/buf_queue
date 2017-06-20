module Subject
	attr_reader :subscribers
	def initialize
		# puts "inside Subject initialize method.."
		@subscribers = []
	end
	
	def add_subscribers(subscribers)
		subscribers.each { |subscriber| @subscribers << subscriber }
	end

	def remove_subscribers(subscribers)
		subscribers.each { |subscriber| @subscribers.delete(subscriber) }
	end
    private
	def notify_subscribers(queue)
		puts "*****************************************************"
		@subscribers.each { |subscriber| subscriber.update(queue) }
		puts "Subscriber notification is done..."
		puts "*****************************************************"
	end
end