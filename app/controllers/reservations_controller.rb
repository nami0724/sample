class ReservationsController < ApplicationController


    def index
        @reservations = Reservation.all.limit(1)
      end
    
      def show
        @reservation = Reservation.find(params[:id])
        @room = Room.find(@reservation.room_id)
        
      end
    
      def new
        @reservation = Reservation.new
        
      end
    
      def create
        @reservation = Reservation.create(params.require(:reservation).permit(:id, :start_date, :end_date, :person, :total_price, :period, :user_id,))
          if @reservation.save
            redirect_to action: "show"
           
          else
            render"new"
          end
      end
    
      def edit
      end
    
      def update
        @reservation = Reservation.find(params[:id])
        if @reservation.update(params.require(:reservation).permit(:id, :start_date, :end_date, :person, :total_price, :period, :user_id))
          redirect_to :reservation
        else
          render"new"
        end
      end
    
      def destroy
      end
    
      private
    
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :person, :total_price, :period, :user_id,)
    end
    end
