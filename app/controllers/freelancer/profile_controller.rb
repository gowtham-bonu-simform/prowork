class Freelancer::ProfileController < ApplicationController
  def show
    @profile = current_user.profile
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      flash[:notice] = 'you have successfully created your profile'
      redirect_to profile_path
    else
      flash.now[:alert] = 'profile creation invalid!'
      render :new, status: :unprocessable_entity
    end
  end

  private

    def profile_params
      params.require(:profile).permit(:professional_role, :bio, :hourly_rate, :postal_code, :phone, :country, :street_address, :city, :state, :skill_list,
      :service_list, experiences_attributes: [:id, :company, :title, :location, :country, :start_date, :end_date, :description, 
      education_histories_attributes: [:id, :school, :degree, :study_field, :from, :to, :description], 
      certifications_atttributes: [:id, :issue_date, :expiration_date, :certification_id, :certification_url], languages_attributes: [:id, :name, :proficiency] ])
    end
end