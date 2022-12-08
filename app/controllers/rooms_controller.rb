class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :post]

    def  top
      @q = Room.ransack(params[:q])
      @rooms = @q.result(distinct: true)
    end

    def index
      @rooms = Room.all
      @q = Room.ransack(params[:q])
      @rooms = @q.result(distinct: true)
    end

    def show
      @room = Room.find(params[:id])
    end

    def new
      @room = Room.new
      @q = Room.ransack(params[:q])
      @rooms = @q.result(distinct: true)
    end

    def create
      @q = Room.ransack(params[:q])
          @rooms = @q.result(distinct: true)
      @room = Room.new(rooms_params)
        if @room.save
          redirect_to new_reservation_path
        else
          render"new"
        end
        
    end

    def edit
      @room = Room.find(params[:id])
      
    end

    def post
      @room = Room.all
      @q = Room.ransack(params[:q])
      @rooms = @q.result(distinct: true)
      
    end

    def update
    end

    def destroy
    end

    def profile
      @q = Room.ransack(params[:q])
      @rooms = @q.result(distinct: true)
    end

    def search
      @results = @q.result
    end
  private
  def set_q
    @q = Room.ransack(params[:q])
  end


    def rooms_params
      params.require(:room).permit(:room_name, :room_introduction, :price, :adress, :image)

    end


  end
