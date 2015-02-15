class DoorsController < ApplicationController
  before_action :set_door, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  

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
    @door = project.doors.build(door_params)
    if @door.save
      redirect_to(:action => 'index')
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
      params.require(:door).permit(:id, :project_id, :name, :image, :measure_from, :frame_material, :door_material, :location, :swing, :fire_rating, :lock_prep, :deadbolt_prep, :lite_kit, :louver, :dim_a, :dim_b, :dim_c, :dim_d, :dim_d, :dim_e, :dim_f, :dim_g, :dim_h, :dim_i, :dim_j, :dim_k, :other_comments, :species, project_attributes: [ :name, :id, :_destroy ])
    end
end