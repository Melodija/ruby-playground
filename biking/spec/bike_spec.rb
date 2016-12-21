require 'bike'

describe Bike do
  it { is_expected.to respond_to :broken?}

  describe '#report_broken' do
    it 'should be able to report a broken bike' do
      expect(subject.broken?).to eq false
      subject.report_broken
      expect(subject).to be_broken
    end
  end
end
