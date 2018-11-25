class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all.order("created_at DESC")
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = current_user.songs.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end



  def create
    @song = current_user.songs.build(song_params)
    @song.category_id = params[:category_id]

    if @song.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def update
    @song.category_id = params[:category_id]
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render 'edit'
    end
  end

  def destroy
    @song.destroy
    redirect_to root_path
  end

  private

    def song_params
      params.require(:song).permit(:title, :description, :author)
    end

    def find_song
      @song = Song.find(params[:id])
    end


end
