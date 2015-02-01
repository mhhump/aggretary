class DoorsController < ApplicationController
  before_action :set_door, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
   @doors = Door.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
 end

  def show
  end

  def new
    @door = current_user.doors.build
  end

  def edit
  end

  def create
    @door = current_user.doors.build(door_params)
    if @door.save
      redirect_to @door, notice: 'Door was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @door.update(door_params)
      redirect_to @door, notice: 'Door was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @door.destroy
    redirect_to doors_url
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_door
      @door = Door.find(params[:id])
    end

    def correct_user
      @door = current_user.doors.find_by(id: params[:id])
      redirect_to doors_path, notice: "Not authorized to edit this door" if @door.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def door_params
      params.require(:door).permit(:name, :image, :measure_from, :frame_material, :door_material, :location, :swing, :fire_rating)
    end
end