require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :bike }

  describe '#release_bike' do
    it 'should release a bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
    end

    it 'should release a working bike' do
      bike = Bike.new
      subject.dock(bike)
      subject.release_bike
      expect(bike).to be_working
    end

    it 'should not release bike if empty' do
      expect { subject.release_bike }.to raise_error 'There are no bikes in dock!'
    end
  end

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'returns docked bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq nil
    end

    it 'raises error if docking station already full' do
      20.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'Docking station is full.'
    end
  end



end
