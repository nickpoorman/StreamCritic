class TagsController < ApplicationController
  before_filter :login_required, :only => [:new, :create]

  def create
    @video = Video.find(params[:video_id])
    @tag = @video.tags.create!(params[:tag])

    current_user.tags << @tag

    #@tag = @video.tags.build(params[:tag])

    #if @tag.save!
      ##If success
    respond_to do |format|
      format.html { redirect_to @video, :notice => "Tag added!" }
      format.js
    end
    #else
      ##send to error?
    #end
    
  end
end
