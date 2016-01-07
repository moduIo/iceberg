class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_gon_values
  before_filter :set_projects
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def set_gon_values

      gon.skills = Skill.all

  end

  def set_projects

      @user = current_user
      @projects = Project.all.reverse
      @skill_categories = SkillCategory.all

  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :username) }
    end

end
