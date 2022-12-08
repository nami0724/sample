class ReservationsController < ApplicationController
  before_action :authenticate_user!

    def index
        @reservations = Reservation.all.order(id: "DESC").limit(1)
        @rooms = Room.all
        @q = Room.ransack(params[:q])
        @rooms = @q.result(distinct: true)
        
        
      end
    
      def show
        @reservation = Reservation.find(params[:id])
        @room = Room.find(params[:id])
        
      end
    
      def new
        @reservation = Reservation.new
        @q = Room.ransack(params[:q])
        @rooms = @q.result(distinct: true)
        
      end
    
      def create
        @reservation = Reservation.new(reservation_params)
        @q = Room.ransack(params[:q])
        @rooms = @q.result(distinct: true)
          if @reservation.save
            redirect_to @reservation
           
          else
            render"new"
          end
      end
    
      def edit
      end
    
      def update
      end
    
      def destroy
      end

    
      private
    
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :person, :total_price, :period, :user_id, :room_id)
    end

  end