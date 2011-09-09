class NotesController < ApplicationController
  load_and_authorize_resource
  def index
    @notes = Note.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  end

  def show
    render :layout => false if request.xhr?
  end
end
