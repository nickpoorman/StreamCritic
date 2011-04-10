class VideosController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  #TODO: Put this back in later in production
  #rescue_from BSON::InvalidObjectId, :with => :redirect_if_not_found
  rescue_from Mongoid::Errors::Validations, :with => :url_exists

  # GET /videos
  def index
    @videos = Video.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /videos/1
  def show
    @video = Video.find(params[:id])
    if !@video.vid.blank?
      @you_tube_id = @video.vid
      respond_to do |format|
        format.html # show.html.erb
        return;
      end
    else
      respond_to do |format|
        format.html { render "verror" } # show.html.erb
      end
    end
  end

  # GET /videos/new
  def new
    @video = Video.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos
  def create
    @video = Video.new(params[:video])

    respond_to do |format|
      if @video.save!
        format.html { redirect_to(@video, :notice => 'Video was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /videos/1
  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to(@video, :notice => 'Video was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /videos/1
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to(videos_url) }
    end
  end

  protected
    def redirect_if_not_found
      render "verror"
      return;
    end

    def url_exists
      if @video.vid.blank?
        render :action => "new"
        return;
      end

      @video = Video.first(conditions: { vid: @video.vid })
      if @video.persisted?
        redirect_to(@video, :notice => 'Video already exists.')
      else
        render :action => "new"
      end
      return;
    end
end
