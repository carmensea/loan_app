class DocumentsController < ApplicationController
  before_action :require_admin_login, only: [:index]
  before_action :require_user_login, only: [:new, :show, :create]

  def new
    @document = Document.new
  end

  def create
    # create a document object to keep track of all files and times uploaded to Box server
    document = Document.new(filename: params[:file].original_filename)
    if document.save!
      upload(params[:file])
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
      file = params[:file]
      filename = "#{Date.today}" + current_user.last_name + "." + current_user.first_name + "." + file.original_filename
      if client.send_file(file.tempfile, filename)
        true
      else
        @errors = client.errors.full_message
      end
    end

    def client
      @client ||= BoxAdapter.new
    end

    def require_admin_login
      unless logged_in? && current_user.admin?
        redirect_to root_path
      end
    end

    def require_user_login
      unless logged_in? && !current_user.admin?
        redirect_to login_path
      end
    end
end
