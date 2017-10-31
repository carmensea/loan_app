class DocumentsController < ApplicationController
  def new
    @document = Document.new
  end

  def create
    document = Document.new(filename: params[:file])
    if document.save!
      upload_to_box(document)
    end
  end

  def index
    client = BoxAdapter.new
    client.boxr_call
    @items = client.show_files
  end

  def show
    file = params[:id]
    client = BoxAdapter.new
    client = client.boxr_call
    @download = client.download_file(file, version: nil, follow_redirect: true)
    send_data @download
  end

  private
    def document_params
      params.require(:document).permit(:file)
    end

    def upload_to_box(document)
      client = BoxAdapter.new
      client.boxr_call
      if client.send_file(params[:file].tempfile)
        true
      else
        @errors = client.errors.full_message
      end
    end
end
