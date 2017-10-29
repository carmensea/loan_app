class BoxController < ApplicationController
  def new
    @client = BoxAdapter.new
  end

  def create
    # this will be a post to box
  end
end
