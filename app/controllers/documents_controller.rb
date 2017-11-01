class DocumentsController < ApplicationController
  def new
    @document = Document.new
  end

  def create
    document = Document.new(filename: params[:file])
    if document.save!
      upload(document)
    end
  end

  def index
    @items = client.show_files
  end

  def show
    file = params[:id]
    @download = client.download_file(file, version: nil, follow_redirect: true)
    send_data @download
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
end
