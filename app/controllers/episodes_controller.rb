class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]

  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    @episodes = Episode.all
    #@episode.convert_to_mp4 '/home/ethan/src/video_app/app/assets/videos/archive/Fate-stay night: Unlimited Blade Works/[HorribleSubs] Fate Stay Night - Unlimited Blade Works - 00 [720p].mkv'
    if File.extname( @episode.dir ) == ".mkv" and @episode.grp == "HorribleSubs"
        @episode.convert_to_horrible "#{Rails.root}/public#{@episode.dir}"
        @episode.rip_to_webvtt "#{Rails.root}/public#{@episode.dir}"
        @path="/videos/tmp/output.mp4"
        @subpath="/videos/tmp/sub.vtt"
    elsif File.extname( @episode.dir ) == ".mp4" and @episode.grp == "DeadFish"
        @path="#{@episode.dir}"
        @subpath="/videos/tmp/blank.vtt"
    elsif File.extname( @episode.dir ) == ".mp4" and @episode.grp == "BakedFish"
        @path="#{@episode.dir}"
        @subpath="/videos/tmp/blank.vtt"
    elsif File.extname( @episode.dir ) == ".mkv" and @episode.grp == "Exiled-Destiny"
        @episode.convert_to_mp4 "#{Rails.root}/public#{@episode.dir}"
        @episode.rip_to_webvtt "#{Rails.root}/public#{@episode.dir}"
        @path="/videos/tmp/output.mp4"
        @subpath="/videos/tmp/sub.vtt"
    elsif File.extname( @episode.dir ) == ".mkv" and @episode.grp == "Coalgirls"
        @episode.convert_to_coalgirls "#{Rails.root}/public#{@episode.dir}"
        @episode.rip_to_webvtt "#{Rails.root}/public#{@episode.dir}"
        @path="/videos/tmp/output.mp4"
        @subpath="/videos/tmp/sub.vtt"
    end
  end

  # GET /episodes/new
  def new
    @episode = Episode.new
  end

  # GET /episodes/1/edit
  def edit
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = Episode.new(episode_params)

    respond_to do |format|
      if @episode.save
        format.html { redirect_to @episode, notice: 'Episode was successfully created.' }
        format.json { render :show, status: :created, location: @episode }
      else
        format.html { render :new }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_to @episode, notice: 'Episode was successfully updated.' }
        format.json { render :show, status: :ok, location: @episode }
      else
        format.html { render :edit }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode.destroy
    respond_to do |format|
      format.html { redirect_to episodes_url, notice: 'Episode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def episode_params
      params.require(:episode).permit(:name, :show_id, :status, :dir, :grp)
    end
end



