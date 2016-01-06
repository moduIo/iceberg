class UsersController < ApplicationController

  def index
    @user = current_user
    @projects = @user.projects
    @skills = @user.skills
    @skill_categories = SkillCategory.all
    @hosted_projects = @projects.where(user_id: current_user.id)
    @all_status_joined_projects = @projects.where.not(user_id: current_user.id)
    @joined_projects = []
    @all_status_joined_projects.each do |joined_project|
      @user_project = UserProject.where(project_id: joined_project.id, user_id: current_user.id).first
      if @user_project.status == 2
        @joined_projects << joined_project
      end
    end
    if params[:project_id] && @projects.where(id: params[:project_id]).empty?
      current_user.projects << Project.find(params[:project_id])
    end
    @user.save
  end

  def show
    redirect_to '/users'
  end

  def create
    redirect_to '/users'
  end

  def destroy
    current_user.skills.find(params[:format]).destroy
    redirect_to :back
  end

  def edit
  end

  def update
    flash[:update] = params[:user][:user_skills_attributes]
    params[:user][:user_skills_attributes].each do |key, value|
      if current_user.skills << Skill.find(value[:skill_id])
      end
    end
    if current_user.save
      flash[:update] = "Skills added successfully"
    end
    redirect_to '/users/index'
  end

end
