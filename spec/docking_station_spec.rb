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

	it 'is bike docked' do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.bike).to eq bike
	end

#	it 'no bikes' do
#		allow(subject).to receive(:bike) {nil}
#		expect(subject.release_bike(bike)).to raise_error("no bikes available")
#	end
end
