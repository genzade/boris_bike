require_relative 'bike'

class DockingStation
	attr_reader :bikes

	def initialize 
		@bikes = []
	end

	def release_bike
		fail 'No bikes available' if @bikes.size == 0 
		@bikes.pop
	end

	def dock(bike)
		fail 'station is full' if @bikes.size >= 20
		@bikes << bike
	end
end
