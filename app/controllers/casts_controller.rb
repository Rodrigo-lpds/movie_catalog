class CastsController < ApplicationController
  before_action :set_cast, only: %i[show edit update destroy]

  def index
    @casts = Cast.all
  end

  def show; end

  def new
    @cast = Cast.new
  end

  def edit; end

  def create
    @cast = Cast.new(cast_params)

    respond_to do |format|
      if @cast.save
        format.html { redirect_to cast_url(@cast), notice: 'Cast was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cast.update(cast_params)
        format.html { redirect_to cast_url(@cast), notice: 'Cast was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cast.destroy

    respond_to do |format|
      format.html { redirect_to casts_url, notice: 'Cast was successfully destroyed.' }
    end
  end

  private

  def set_cast
    @cast = Cast.find(params[:id])
  end

  def cast_params
    params.require(:cast).permit(:movie_id, :actor_id)
  end
end
