class TagsController < ApplicationController
  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @notes = Note.tagged_with(@tag).order("created_at desc").paginate(:page => params[:page])
    respond_to do |what|
      what.html
      what.atom { @title = "Alle Notes, die mit #{@tag.name} getaggt sind"
                  render :template => "notes/index.atom.builder" }
    end
  end

end
