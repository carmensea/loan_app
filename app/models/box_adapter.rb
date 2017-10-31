require 'boxr'

class BoxAdapter < ApplicationRecord
  attr_accessor :client

  def boxr_call
    @client = Boxr::Client.new
  end


  def send_file(file)
    folder = @client.folder_from_path('/')
    box_file = @client.upload_file(file, folder)
    updated_file = @client.create_shared_link_for_file(box_file, access: :open)
    return true
  end
end

