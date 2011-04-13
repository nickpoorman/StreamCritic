class TagsController < ApplicationController
  before_filter :login_required, :only => [:new, :create]

  def create
    @video = Video.find(params[:video_id])
    @tag_enum = @video.tags.create!(params[:tag])

    respond_to do |format|
      format.html { redirect_to @video, :notice => "Tag added!" }
      format.js
    end
  end
end
