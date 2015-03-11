class ProjectsController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  

  def index
   @projects = current_user.projects.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
 end

  def show
    @project = Project.find(params[:id])
    @doors = @project.doors
  end

  def new
    @project = current_user.projects.build
    @project.doors.build
  end

  def edit
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def correct_user
      @project = current_user.projects.find_by(id: params[:id])
      redirect_to projects_path, notice: "You are not authorized for this project" if @project.nil?
    end

    def project_params
      params.require(:project).permit(:id, :name, doors_attributes: [ :id, :_destroy, :project_id, :name, :image, :measure_from, :frame_material, :door_material, :location, :swing, :fire_rating, :lock_prep, :deadbolt_prep, :lite_kit, :louver, :dim_a, :dim_b, :dim_c, :dim_d, :dim_d, :dim_e, :dim_f, :dim_g, :dim_h, :dim_i, :dim_j, :dim_k, :other_comments, :species, :existing_frame ])
    end
end
