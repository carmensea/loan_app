require 'rails_helper'

RSpec.describe BoxAdapter, type: :model do
  let(:client) { BoxAdapter.new }

  context 'Successful request to Box' do
    it 'creates a new instance of Boxr::Client' do
      expect(client.boxr_call).to be_an_instance_of(Boxr::Client)
    end
  end
end
