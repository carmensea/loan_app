require 'boxr'

class BoxAdapter < ApplicationRecord
  attr_accessor :client

  def boxr_call
    @client = Boxr::Client.new
  end


  def send_file(params)
    @folder = @client.folder_from_path(params['path'])
    @file = @client.upload_file(params['file'], @folder)
    @updated_file = @client.create_shared_link_for_file(@file, access: :open)
    puts "Successfully uploaded file: #{params['file']}"
  end
end

