require 'rails_helper'

RSpec.describe BoxAdapter, type: :model do
  let(:adapter) { BoxAdapter.new }
  let(:file) { File.new(Rails.root.join('app', 'assets', 'images', 'BOA_logo.png')) }


  it 'creates a new instance of Boxr::Client' do
    expect(adapter.client).to be_an_instance_of(Boxr::Client)
  end

  describe "#send_file" do
    before do
      allow_any_instance_of(Boxr::Client).to receive(:upload_file).with(file, 0, name: "BOA_logo.png")
    end
    it 'returns true after sending file' do
      expect(adapter.send_file(file, "BOA_logo.png")).to be true
    end
  end

  describe "#download_file" do
    before do
      allow_any_instance_of(Boxr::Client).to receive(:download_file).with(file, version: nil, follow_redirect: true)
    end
    it 'returns true after downloading file' do
      expect(adapter.download_file(file)).to be true
    end
  end
end
