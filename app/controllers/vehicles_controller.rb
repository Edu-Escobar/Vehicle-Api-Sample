class VehiclesController < ApplicationController
  ActionController::Live

  # Order every locations when we access to the index direction.
  def index
    vehicles = Vehicle.order('created_at DESC');
    render json: {status: 'SUCCESS', message:'Loaded vehicles', data:vehicles},status: :ok
  end

  # Used for Get requests.
  def show
    vehicle = Vehicle.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded vehicle', data:vehicle},status: :ok
  end

  # Used for Post requests.
  def create
    vehicle = Vehicle.new(vehicle_params)

    if vehicle.save
      render json: {status: 'SUCCESS', message:'Saved vehicle', data:vehicle},status: :ok
    else
      render json: {status: 'ERROR', message:'Vehicle not saved', data:vehicle.errors},status: :unprocessable_entity
    end
  end

  # Used for Delete requests.
  def destroy
    vehicle = Vehicle.find(params[:id])
    vehicle.destroy
    render json: {status: 'SUCCESS', message:'Deleted vehicle', data:vehicle},status: :ok
  end

  # Used for Put requests.
  def update
    vehicle = Vehicle.find(params[:id])
    if vehicle.update(vehicle_params)
      render json: {status: 'SUCCESS', message:'Updated vehicle', data:vehicle},status: :ok
    else
      render json: {status: 'ERROR', message:'Vehicle not updated', data:vehicle.errors},status: :unprocessable_entity
    end
  end

  # For privacy reasons, the params permitted remains private.
  private

  def vehicle_params
    params.permit(:id)
  end
end