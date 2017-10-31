require 'boxr'

class BoxAdapter < ApplicationRecord
  attr_accessor :client, :items

  def boxr_call
    @client = Boxr::Client.new
  end


  def send_file(file)
    folder = @client.folder_from_path('/')
    @client.upload_file(file, folder)
    return true
  end

  def show_files
    @items = @client.folder_items(Boxr::ROOT)
  end
end

