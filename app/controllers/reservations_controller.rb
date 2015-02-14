class ReservationsController < ApplicationController
  before_action :find_restaurant
  
  def find_reservation
  	Reservation.find(params[:id])
  end

  def new
  	@reservation = Reservation.new
  end

  def show
  @reservation = find_reservation
  end

  def create
  @reservation = Reservation.new(reservation_params)
  @reservation.restaurant = @restaurant
  @reservation.user = current_user

	  if @reservation.save
	  	redirect_to restaurants_path(@restaurant)
	  else
	  	flash[:notice] = @reservation.errors.full_messages.to_sentence
	  	render :new
	  end 
  end

  def update
  	@reservation = Reservation.find(params[:id])
  		if @reservation.update_attributes(reservation_params)
  			redirect_to restaurants_url(@restaraunt)
  		else
  			render :edit
  		end
  end

  def destroy
  	@reservation = Reservation.find(params[:id])
  	@reservation.destroy
  	redirect_to restaurant_url(@restaurant)
  end

  def edit
  	@reservation = Reservation.find(params[:id])
  end

private
def find_restaurant
	@restaurant = Restaurant.find(params[:restaurant_id])
end

def reservation_params
	params.require(:reservation).permit(:party_size, :booking)
end
end
