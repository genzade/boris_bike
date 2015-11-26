require '/Users/zade/Desktop/Projects/boris_bike/lib/docking_station.rb'

docking_station = DockingStation.new

20.times { docking_station.dock Bike.new }