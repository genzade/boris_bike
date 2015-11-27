require_relative 'bike'

class DockingStation
	
	attr_accessor :capacity

	DEFAULT_CAPACITY = 20

	def initialize(capacity=DEFAULT_CAPACITY) 
		@bikes = []
		@capacity = capacity
	end

	def release_bike
		fail 'No bikes available' if empty? 
		fail 'Bike is broken' if @bikes.last.broken? == true
		@bikes.pop 
	end

	def dock(bike)
		fail 'station is full' if full?
		@bikes << bike
	end

	private

	attr_reader :bikes 
	
	def empty?
		@bikes.empty?
	end

	def full?
		@bikes.size >= @capacity 
	end

end
