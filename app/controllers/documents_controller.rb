class DocumentsController < ApplicationController
  before_action :require_login, only: [:index]

  def new
    @document = Document.new
  end

  def create
    # create a document object to keep track of all files and times uploaded to Box server
    document = Document.new(filename: params[:file].original_filename)
    if document.save!
      upload(params[:file.temp])
    end
  end

  def index
    @items = client.show_files
  end

  def show
    file = params[:id]
    send_data client.download_file(file)
  end

  private
    def document_params
      params.require(:document).permit(:file)
    end

    def upload(document)
      if client.send_file(params[:file].tempfile)
        true
      else
        @errors = client.errors.full_message
      end
    end

    def client
      @client ||= BoxAdapter.new
    end

    def require_login
      unless current_user
        redirect_to root_url
      end
    end
end
