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
