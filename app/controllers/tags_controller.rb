class TagsController < ApplicationController

  def create
    @video = Video.find(params[:video_id])
    @tag = @video.tags.create!(params[:tag])
    redirect_to @video, :notice => "Tag added!"
  end
end
