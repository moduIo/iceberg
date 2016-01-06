class MessagesController < ApplicationController
  def index
    @messages = Message.where(receiver_id: current_user.id)
  end


  def show
  end

  def new
    @message = Message.new
    @sender = User.find(params[:sender_id])
    @project = Project.find(params[:project_id])
    current_user.projects << @project
    @user_project = UserProject.where(project_id: @project.id, user_id: current_user.id).first
    @user_project.update(status: 1)
    @content = "#{@sender.username} would like to join #{@project.name}. Do you accept?"
    @message.update(sender_id: @sender.id, receiver_id: @project.user.id, project_id: @project.id,
      content: @content)
    @message.save
    redirect_to :back
  end

  def destroy
    @user = User.find(params[:sender_id])
    @project = Project.find(params[:project_id])
    @user_project = UserProject.where(user_id: @user.id, project_id: @project.id).first
    @user_project.update(status: params[:status])
    @user_project.save
    Message.find(params[:id]).destroy
    redirect_to messages_path
  end

end
