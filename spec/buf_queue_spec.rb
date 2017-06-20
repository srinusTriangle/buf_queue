require "spec_helper"

RSpec.describe BufQueue do
  let (:bq)  {Bq.new}
  it "has a version number" do
    expect(BufQueue::VERSION).not_to be nil
  end

  it "subscribers correctness :: Initializing & length of subscribers" do
	no_of_subscribers = 2
	BufQueue.initialize_subscribers(bq, no_of_subscribers)
    expect(bq.subscribers.length).to eq(no_of_subscribers)
  end

  it "initializing queue with the given size" do
  	index, queue_size = 2, 5
  	bq.initialize_queue(index, queue_size)
  	expect(bq.map[index].size).to eq(queue_size)
  end

  it "adding new data to queue at given index" do
  	data = {"key" => 3434}
  	index = 3
  	queue_size = 2
  	bq.initialize_queue(index, queue_size)
  	bq.add(index, data)
  	expect(bq.map[index].queue.include? data).to eq(true)
  end

  it "checking queue has reached max size and flushing queue including with notifying subscribers" do
  	data = {"key" => 3434}
  	index = 3
  	queue_size = 1
  	bq.initialize_queue(index, queue_size)
  	bq.add(index, data)
  	expect(bq.map[index]).to eq(nil)
  end

end
