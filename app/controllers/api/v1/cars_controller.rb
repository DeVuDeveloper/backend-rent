class Api::V1::CarsController < ApplicationController

  def index
    @response = []
    @cars = Car.all
    @serialized_cars = CarSerializer.new(@cars).serializable_hash[:data]

    if @serialized_cars.empty?
      render json: { error: 'not found', error_message: ['No cars found'] }, status: :not_found
    else
      @serialized_cars.each do |car|
        @response << {
          id: car[:attributes][:id],
          carModel: car[:attributes][:car_model],
          carTransmission: car[:attributes][:transmission],
          carType: car[:attributes][:car_type],
          rentPrice: car[:attributes][:price_per_day],
          carDescription: car[:attributes][:description],
          carImg: car[:attributes][:image_url]
        }
      end
      puts response
      render json: { data: @response, message: ['All cars loaded'] }, status: :ok
    end
  end

  def show
    @car = Car.find(params[:id])
    render json: CarSerializer.new(@car).serializable_hash[:data][:attributes], status: :ok
  end

  def create
    @car = current_user.cars.new(car_params)
    if @car.save
      render json: CarSerializer.new(@car).serializable_hash[:data][:attributes]
    else
      render json: @car.errors, status: 422
    end
  end

  def destroy
    @car = Car.find(params[:id])
    if @car.destroy
      render json: { message: 'Car has been successfully deleted' }
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def car_params
    params.require(:car).permit(:car_model, :price_per_day, :description,
                                :car_type, :transmission, :user_id, :image, :image_url)
  end
end
