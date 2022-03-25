class SightingsController < ApplicationController
  def index
    sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: sightings
  end

  def update
    sighting = Sighting.find(params[:id])
    sighting.update(sighting_params)
    if sighting.valid?
      render json: sighting
    else
      render json: sighting.errors
    end
  end

  def destroy
    sighting = Sighting.find(params[:id])
    if sighting.destroy
      render json: sighting
    else
      render json: sighting.errors
    end
  end

  private
  def sighting_params
    params.require(:sighting).permit(:start_date, :end_date, :latitude_degrees, :longitutde_degrees)
  end
end
