require 'rails_helper'

RSpec.describe BoxAdapter, type: :model do
  it 'creates a new instance of Boxr::Client' do
    client = BoxAdapter.new
    expect(client.boxr_call).to be_an_instance_of(Boxr::Client)
  end

  it 'returns a successful message' do
    client = BoxAdapter.new
    client.boxr_call
    expect(client.send_file({path: '/', file: 'test.txt'})).to raise_error
  end
end
