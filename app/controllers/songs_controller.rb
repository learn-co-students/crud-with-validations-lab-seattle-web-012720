class SongsController < ApplicationController
  def destroy
    @song = Song.find_by_id(params[:id])
    @song.delete
    redirect_to songs_path
  end
  
  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :new
    end
    
  end

  def edit
    @song = Song.find_by_id(params[:id])
  end

  def update
    # byebug
    @song = Song.find_by_id(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by_id(params[:id])
  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
