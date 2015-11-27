require 'docking_station'

describe DockingStation do
  let(:bike) { Bike.new }
	it { is_expected.to respond_to :release_bike }

	describe '#release_bike' do	
		it 'release bike' do
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end

		it 'raises error when there are no bikes' do
			expect { subject.release_bike }.to raise_error 'No bikes available'
		end

    it 'raises error if the bike is not working' do
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike}.to raise_error 'Bike is broken'
    end

	end

  it 'raises error when docking station is full' do
    subject.capacity.times { subject.dock(Bike.new) }
    expect { subject.dock(Bike.new) }.to raise_error 'station is full'
  end

  it 'has a variable capacity' do
    docking_station = DockingStation.new(50)
    50.times { docking_station.dock Bike.new }
    expect{ docking_station.dock Bike.new }.to raise_error 'station is full'
  end

  it 'excepts DEFAULT_CAPACITY to be 20' do 
    station = DockingStation.new 
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

	it 'is bike docked' do
		subject.dock(bike)
		expect(subject.release_bike).to eq bike
	end

end
