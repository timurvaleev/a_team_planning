class PlansController < ApplicationController
  before_filter :authenticate_user!

  def index
    render :text => user.inspect, :layout =>true
  end

  private

  def user
    if params[:user_name] && current_user.can_manage?
      User.where(:name => params[:user_name]).first
    else
      current_user
    end
  end
end
