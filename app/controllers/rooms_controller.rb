class RoomsController < ApplicationController

    def  top
      @rooms = Room.all
    end

    def index
      @rooms = Room.all
    end

    def show
      @room = Room.find(params[:id])
    end

    def new
      @room = Room.new
    end

    def create
      @room = Room.new(rooms_params)
      binding.pry
        if @room.save
          redirect_to :rooms
          # redirect_to controller: :reservation, action: :new
        else
          render"new"
        end
    end

    def edit
      @room = Room.find(params[:id])
      
    end

    def post
      @room = Room.all
    end

    def update
    end

    def destroy
    end

  private
    def rooms_params
      params.require(:room).permit(:room_name, :room_introduction, :price, :adress, :image)

    end
  end
