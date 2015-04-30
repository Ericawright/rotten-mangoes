class MoviesController < ApplicationController
  # scope :search, -> {where("director LIKE ? OR title LIKE ?", "%#{params[:search]}%")}
 # scope :search, -> {where("director LIKE ?", "%#{params[:search]}%")}
  def search
    if params[:duration] !=  'none'
      split = params[:duration].split("-")
      min = split[0]
      max = split[1]
    end
    @movies = Movie.all
    @movies = @movies.search(params[:search]).duration(min,max)
    render :index
  end

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :image, :remote_image_url, :description
    )
  end
end
