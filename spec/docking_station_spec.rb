require 'docking_station'

describe DockingStation do
	it { is_expected.to respond_to :release_bike }

	describe '#release_bike' do	
		it 'release bike' do
			bike = Bike.new
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end

		it 'raises error when there are no bikes' do
			expect { subject.release_bike }.to raise_error 'No bikes available'
		end
	end

  it 'raises error when docking station is full' do
    20.times { subject.dock(Bike.new) }
    expect { subject.dock(Bike.new) }.to raise_error 'station is full'
  end

	it 'is bike docked' do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.release_bike).to eq bike
	end

end
