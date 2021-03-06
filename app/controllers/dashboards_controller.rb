class DashboardsController < ApplicationController
  before_action :check

  def index
    @users = User.order(:id)
  end

  def update
    user = User.find(params[:user_id])
    user.role = User.roles.key(params[:role_id].to_i)
    if user.save
      notice = "User #{user.name} has been updated"
      redirect_to  dashboard_path, notice: notice
    else
      alert = "User #{user.name} couldn't be updated"
      redirect_to  dashboard_path,  alert: alert
    end
  end

  def delete
    user = User.find(params[:user_id])
    if user.comments.destroy_all && user.posts.destroy_all && user.delete
      redirect_to dashboard_path, notice: "Usuario #{user.name} has been deleted"
    else
      redirect_to dashboard_path, alert: "Usuario #{user.name} couldn't be deleted"
    end
  end

  private
    def check
      permit = authenticate_user! && current_user.admin?
      unless permit
        redirect_to root_path
      end
    end
end
