class ProjectsController < ApplicationController


  def index

    # initially show all project categories
    @categories = ProjectCategory.all


  end

  def show

    # show all projects under the selected project category
    @projects = Project.where(project_category_id: params[:project_category_id])
    if current_user
      @user_projects = UserProject.where(user_id:current_user.id)
    end

  end

  def new
    if !user_signed_in?
      flash.alert = "Users must be signed up to log in"
      redirect_to new_user_session_path
    end
    @project = Project.new
    @categories = ProjectCategory.all
    @skill_categories = SkillCategory.all
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      current_user.projects << @project
      @user_project = UserProject.where(project_id: @project.id, user_id: current_user.id).first
      @user_project.update(status: 2)
      flash[:update] = "Project created successfully"
    else
      flash[:error] = @project.errors.full_messages.to_sentence
    end
    redirect_to :back

  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find_by(params[:id])
    @name = params[:project][:name]
    @public_description = params[:project][:public_description]
    @private_description = params[:project][:private_description]
    @project.update(name: @name, public_description: @public_description,
                  private_description: @private_description)
    if @project.save
      flash[:update] = "Project successfully updated"
    end
    redirect_to root_path
  end

  def destroy
    @project = Project.find_by(params[:id])
    if params[:joined]
      current_user.projects.delete @project
      flash[:update] = "Left project successfully"
    else
      @project.destroy
      flash[:update] = "Project deleted successfully"
    end
    redirect_to :back
  end

  private

    def project_params
      params.require(:project).permit(:name, :public_description,
        :private_description, :project_category_id,
        project_skills_attributes: [:skill_id, :_destroy])
    end

end
