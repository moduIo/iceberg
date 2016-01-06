class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_gon_values
  before_filter :set_user
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def set_gon_values

      gon.skills = Skill.all

  end

  def set_user

      @user = current_user

      if @user == nil
        return
      end

      @projects = Project.all
      @skills = @user.skills
      @skill_categories = SkillCategory.all
      @hosted_projects = @projects.where(user_id: current_user.id)
      @all_status_joined_projects = @projects.where.not(user_id: current_user.id)
      @joined_projects = []
      #@all_status_joined_projects.each do |joined_project|
        #@user_project = UserProject.where(project_id: joined_project.id, user_id: current_user.id).first
        #if @user_project.status == 2
          #@joined_projects << joined_project
        #end
      #end
      #if params[:project_id] && @projects.where(id: params[:project_id]).empty?
        #current_user.projects << Project.find(params[:project_id])
      #end
      @user.save

  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :username) }
    end

end
