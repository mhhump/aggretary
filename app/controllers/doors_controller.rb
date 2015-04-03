class DoorsController < ApplicationController
  before_action :set_opening
  before_action :set_project
  before_action :set_door, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  

  def index
    @opening = Opening.find(params[:opening_id])
    @doors = @opening.doors.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
  end

  def show
    @opening = Opening.find(params[:opening_id])
    @door = @opening.doors
  end

  def new
    @opening = Opening.find(params[:opening_id])
    @door = @opening.doors.build
  
  end

  def edit
    @opening = Opening.find(params[:opening_id])
  end

  def create
    @opening = Opening.find(params[:opening_id])
    @door = @opening.doors.build(door_params)
    @door.user = current_user

    if @door.save
      redirect_to @opening
    else
      render action: 'new'
    end

  end

  def update
    if @door.update(door_params)
      redirect_to @opening, notice: 'Door was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @opening = Opening.find(params[:opening_id])
    @door.destroy
    redirect_to @opening
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_door
      @door = Door.find(params[:id])
    end

    def set_opening
      @opening = Opening.find(params[:opening_id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def correct_user
      @door = current_user.doors.find_by(id: params[:id])
      redirect_to doors_path, notice: "Not authorized to edit this door" if @door.nil?
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def door_params
      params.require(:door).permit(:id, :opening_id, :project_id, :name, :image, :measure_from, :frame_material, :door_material, :location, :swing, :fire_rating, :lock_prep, :deadbolt_prep, :lite_kit, :louver, :dim_a, :dim_b, :dim_c, :dim_d, :dim_d, :dim_e, :dim_f, :dim_g, :dim_h, :dim_i, :dim_j, :dim_k, :other_comments, :species, :existing_frame, opening_attributes: [:number, :project_id, :id, :_destroy], project_attributes: [ :name, :id, :_destroy ])
    end

end