class BoxController < ApplicationController
  def new
    @client = BoxAdapter.new
  end

  def create
    @client = BoxAdapter.new
    @client.boxr_call
    p "*" * 100
    p params[:file]
    if @client.send_file(params[:file])
      redirect_to 'index'
    else
      @errors = @client.error.full_message
    end
  end

  def index
  end
end
