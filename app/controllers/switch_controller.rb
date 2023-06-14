class SwitchController < ApplicationController
  def land
    if current_user.has_role? :client
      redirect_to client_posts_path
    else
      redirect_to new_profile_path
    end
  end

  def become_freelancer
    current_user.add_role :freelancer
    redirect_to new_profile_path, notice: 'you have become freelancer!'
  end

  def switch_as_client
    redirect_to client_posts_path, notice: 'switched to client!'
  end

  def switch_as_freelancer
    redirect_to new_profile_path, notice: 'switched to freelancer!'
  end
end
