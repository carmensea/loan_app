require 'rails_helper'

RSpec.describe BoxAdapter, type: :model do
  let(:adapter) { BoxAdapter.new }

  before do
    stub_box_items_request
  end

  it 'creates a new instance of Boxr::Client' do
    expect(adapter.client).to be_an_instance_of(Boxr::Client)
  end

  it 'returns true after sending file' do
    p stub_file
    expect(adapter.send_file(stub_file.to_s, "test")).to_be true
  end
end
