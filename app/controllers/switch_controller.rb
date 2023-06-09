class SwitchController < ApplicationController
  before_action :authenticate_user!
  def land
    if current_user.has_role? :client and !current_user.has_role? :freelancer
      redirect_to admin_posts_path
    else
      redirect_to new_freelancer_profile_path
    end
  end

  def become_freelancer
    redirect_to new_freelancer_profile_path
  end

  def switch_as_client
    redirect_to admin_posts_path
  end
end
