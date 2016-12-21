require 'docking_station'

describe DockingStation do
  let(:bike) { Bike.new }
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#initialize' do
    subject { DockingStation.new }

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'can have a variable capacity' do
      docking_station = DockingStation.new(50)
      expect(docking_station.capacity).to eq 50
    end

    it 'should react to variable capacity' do
      described_class::DEFAULT_CAPACITY.times { subject.dock(bike)}
      expect { subject.dock(bike) }.to raise_error 'Docking station is full.'
    end
  end

  describe '#release_bike' do
    it 'should release a bike' do
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
    end

    it 'should release a working bike' do
      subject.dock(bike)
      subject.release_bike
      expect(bike).to_not be_broken
    end

    it 'should not release bike if empty' do
      expect { subject.release_bike }.to raise_error 'Bike is either broken or not available.'
    end

    it 'should not release a bike if it is broken' do
      bike.report_broken
      subject.dock(bike)
      expect {subject.release_bike}.to raise_error 'Bike is either broken or not available.'
    end
  end

  describe '#dock' do
    it 'docks a bike' do
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'raises error if docking station already full' do
      subject.capacity.times { subject.dock(bike)}
      expect { subject.dock(Bike.new) }.to raise_error 'Docking station is full.'
    end

    it 'should accept a bike even if it is broken' do
      bike.report_broken
      expect(subject.dock(bike)).to eq [bike]
    end
  end
end
