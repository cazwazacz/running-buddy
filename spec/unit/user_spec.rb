require './app/models/user'

describe User do
  let (:subject) { described_class.new }
  let (:request_double) { double('request_double', where: []) }

  describe '#notifcations' do
    it 'returns 0 when the length of the array is zero' do
      expect(subject.notifications(request_double)).to eq 0
    end
  end

  describe '#requested?' do
    it 'returns true when the length of the array is greater than 0' do
      allow(request_double).to receive(:where).and_return([1])
      expect(subject.requested?(request_double, 1)).to eq true
    end

    it 'returns false when the length of the array is 0 or less' do
      expect(subject.requested?(request_double, 1)).to eq false
    end
  end
end
