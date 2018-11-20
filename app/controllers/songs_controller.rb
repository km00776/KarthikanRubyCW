class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all.order("created_at DESC")
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def song_params
      params.require(:song).permit(:title, :descrption, :author)
    end

    def find_song
      @song = Song.find(params[:id])
    end


end
