class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy add_actor_to_cast]

  def index
    @movies = Movie.all
  end

  def show
    movie_actors_ids = @movie.actors.pluck(:id)
    @available_actors = Actor.where.not(id: movie_actors_ids)
  end

  def new
    @movie = Movie.new
  end

  def edit; end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: 'Movie was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: 'Movie was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
    end
  end

  def add_actor_to_cast
    respond_to do |format|
      if Cast.create(movie_id: @movie.id, actor_id: params[:actor_id])
        format.html { redirect_to movie_url(@movie), notice: 'Ator adicionado com sucesso' }
      else
        format.html { render :show, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :release_year, :actor_id)
  end
end
