require './app/models/user'

describe User do
  let (:subject) { described_class.new }
  let (:request_double) { double('request_double', where: []) }

  it '#notifications' do
    expect(subject.notifications(request_double)).to eq 0
  end
end
