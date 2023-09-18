class LecturesController < ApplicationController
  before_action :find_lecture, only: [:show, :edit, :update, :destroy]

  # List all lectures
  def index
    @lectures = Lecture.all
  end

  # Display a single lecture
  def show
  end

  # Display the form for a new lecture
  def new
    @lecture = Lecture.new
  end

  # Actually create the lecture record in the database
  def create
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
      redirect_to @lecture, notice: 'Lecture was successfully created.'
    else
      render :new
    end
  end

  # Display the edit form for a lecture
  def edit
  end

  # Actually update the lecture record in the database
  def update
    if @lecture.update(lecture_params)
      redirect_to @lecture, notice: 'Lecture was successfully updated.'
    else
      render :edit
    end
  end

  # Destroy a lecture record
  def destroy
    @lecture.destroy
    redirect_to lectures_path, notice: 'Lecture was successfully destroyed.'
  end

  private

  def find_lecture
    @lecture = Lecture.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Lecture not found!"
    redirect_to lectures_path
  end

  def lecture_params
    params.require(:lecture).permit(:title, :description, :lecture_type, :content_type, :content_link)
  end
end
