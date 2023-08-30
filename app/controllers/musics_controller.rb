# app/controllers/musics_controller.rb

class MusicsController < ApplicationController
  before_action :find_music, only: [:edit, :update, :destroy]

  def index
    @musics = Music.all
    @songs = Music.where(music_type: 'song')
    @snippets = Music.where(music_type: 'snippet')
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params)
    if @music.save
      redirect_to musics_path, notice: 'Music was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @music.update(music_params)
      redirect_to musics_path, notice: 'Music was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @music.destroy
    redirect_to musics_path, notice: 'Music was successfully destroyed.'
  end

  private

  def find_music
    @music = Music.find(params[:id])
  end

  def music_params
    params.require(:music).permit(:title, :description, :music_type, :url, :release_date, :artist, :lyrics, :genre, :album, :audio)
  end
end
