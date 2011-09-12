class NotesController < ApplicationController
  load_and_authorize_resource :except => :share
  authorize_resource
  def index
    @notes = Note.order("created_at desc").paginate(:page => params[:page])
    respond_to do |what|
      what.html
      what.atom { @title = "Die letzten Notes"}
    end
  end

  def show
    render :layout => false if request.xhr?
  end

  def new
  end
  def create
    @note.user = current_user
    if @note.save
      redirect_to @note, :notice => "Angelegt!"
    else
      render :action => "new"
    end
  end

  def share
    @note = Note.initialize_from_tumblr(params)
    render :template => "notes/new", :layout => "share"
  end
end
