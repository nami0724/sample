class PlansController < ApplicationController
def index
    @plans = Plan.all
    @q = Room.ransack(params[:q])
end

def new
    @plan = Plan.new
    @q = Room.ransack(params[:q])
end

def create
    @plan = Plan.new(plan_params)
    @q = Room.ransack(params[:q])
      if @plan.save
        redirect_to @plan
      else
            render"new"
      end
end

def show
  @plan = Plan.find(params[:id])
  @q = Room.ransack(params[:q])
end

def post
end

def destroy
end


private
  def plan_params
    params.require(:plan).permit(:place, :start_date, :end_date, :plan_date, :round, :plan, :plan_id)
  end

end

