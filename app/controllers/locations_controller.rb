class LocationsController < ApplicationController
  ActionController::Live

  # Order every locations when we access to the index direction.
  def index
    locations = Location.order('created_at DESC');
    render json: {status: 'SUCCESS', message:'Loaded locations', data:locations},status: :ok
  end

  # Used for Get requests.
  def show
    location = Location.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded location', data:location},status: :ok
  end

  # Used for Post requests.
  def create
    location = Location.new(location_params)
    
    #If the location update does not success, status changes to 'ERROR'.
    if location.save
      render json: {status: 'SUCCESS', message:'Saved location', data:location},status: :ok
    else
      render json: {status: 'ERROR', message:'Location not saved', data:location.errors},status: :unprocessable_entity
    end
  end

  # Used for Delete requests.
  def destroy
    location = Location.find(params[:id])
    location.destroy
    render json: {status: 'SUCCESS', message:'Deleted location', data:location},status: :ok
  end

  # Used for Put requests.
  def update
    location = Location.find(params[:id])
    if location.update(location_params)
      render json: {status: 'SUCCESS', message:'Updated location', data:location},status: :ok
    else
      render json: {status: 'ERROR', message:'Location not updated', data:location.errors},status: :unprocessable_entity
    end
  end

  # For privacy reasons, the params permitted remains private.
  private

  def location_params
    params.permit(:id, :lat, :lng, :at)
  end
end