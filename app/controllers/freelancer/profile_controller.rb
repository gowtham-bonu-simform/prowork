class Freelancer::ProfileController < ApplicationController
  def new
    @profile = Profile.new
    @profile.experiences.build
    @profile.education_histories.build
    @profile.certifications.build
    2.times {@profile.languages.build}
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      flash.now[:notice] = 'success'
    else
      flash.now[:alert] = 'failure'
      render :new, status: :unprocessable_entity
      #debugger
    end
  end

  private

    def profile_params
      params.require(:profile).permit(:professional_role, :bio, :hourly_rate, :postal_code, :phone, :country, :street_address, :city, :state, :skill_list,
        :service_list, experiences_attributes: [:id, :company, :title, :location, :country, :start_date, :end_date, :description], 
        education_histories_attributes: [:id, :school, :degree, :study_field, :from, :to, :description], 
        certifications_atttributes: [:id, :issue_date, :expiration_date, :certification_id, :certification_url], languages_attributes: [:id, :name, :proficiency] )
    end
end