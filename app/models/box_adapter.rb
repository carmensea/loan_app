require 'boxr'

class BoxAdapter < ApplicationRecord
  attr_accessor :client, :items

  def initialize
    @client = Boxr::Client.new
  end


  def send_file(file, name)
    folder = @client.folder_from_path('/')
    @client.upload_file(file, folder, name: name)
    return true
  end

  def show_files
    @items = @client.folder_items(Boxr::ROOT)
  end

  def download_file(file)
    @client.download_file(file, version: nil, follow_redirect: true)
  end
end

