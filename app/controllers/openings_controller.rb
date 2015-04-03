class OpeningsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_project
  before_action :set_opening, only: [:show, :edit, :update, :destroy]
  
  

  def index
    @project = Project.find(params[:project_id])
    @openings = @project.openings.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
  end

  def show
    @project = Project.find(params[:project_id])
    @doors = @opening.doors
  end

  def new
    @project = Project.find(params[:project_id])
    @opening = @project.openings.build
    @opening.doors.build

  
  end

  def edit
    @project = Project.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    @opening = @project.openings.build(opening_params)
    @opening.user = current_user
    @opening.doors.first


    if @opening.save
      redirect_to @project
    else
      render action: 'new'
    end

  end

  def update
    if @opening.update(opening_params)
      redirect_to @project, notice: 'opening was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @opening.destroy
    redirect_to @project
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opening
      @opening = Opening.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def correct_user
      @opening = current_user.openings.find_by(id: params[:id])
      redirect_to openings_path, notice: "Not authorized to edit this opening" if @opening.nil?
    end

    def opening_params
      params.require(:opening).permit(:id, :number, :width, :height, :location, :location_1, :location_2, :fire_rating, :swing, doors_attributes: [ :id, :_destroy, :project_id, :name, :image, :measure_from, :frame_material, :door_material, :location, :swing, :fire_rating, :lock_prep, :deadbolt_prep, :lite_kit, :louver, :dim_a, :dim_b, :dim_c, :dim_d, :dim_d, :dim_e, :dim_f, :dim_g, :dim_h, :dim_i, :dim_j, :dim_k, :other_comments, :species, :existing_frame ])
    end

  end
