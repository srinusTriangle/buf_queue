# BufQueue

# Constraints & Limitations:

1. Number of subscribers, Queue Size and Map Size (n) has been initialized with default values for now. This would be
improved in next version.
2. All the input like type of messages, data generates randomly and pushes into some queue without any order.
3. Queue size (B) is also random value and flushes the queue when it has reached the max queue size.
4. For now, all the subscribers are listening to every queue, which can be customized next version.
5. For now a single publisher is sending data to Q, but when there are N number of publishers there will be a problem
with concurrency which need to handle.


## Installation
Assuming ruby is installed on machine
Ruby version should be >= 2.1.1


And then execute:
	$ gem install bundler
    $ gem install buf_queue

## Usage

	$ irb
	$ $: << 'lib'
	$ require 'buf_queue'
	$ include BufQueue
	$ generate_input

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BufQueue project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/buf_queue/blob/master/CODE_OF_CONDUCT.md).
