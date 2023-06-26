class Freelancer::ProfileController < ApplicationController
  def show
    @profile = current_user.profile
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save and @current_page == 'info'
      redirect_to experiences_profile_path
    else
      flash.now[:alert] = 'profile creation invalid!'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      if @current_page == 'info'
        redirect_to experiences_profile_path
      elsif @current_page == 'experiences'
        redirect_to education_profile_path
      elsif @current_page == 'education'
        redirect_to certifications_profile_path
      elsif @current_page == 'certifications'
        redirect_to languages_profile_path
      else
        redirect_to root_path
      end
    else
      if @current_page == 'info'
        render :edit, status: :unprocessable_entity
      elsif @current_page == 'experiences'
        render :experiences, status: :unprocessable_entity
      elsif @current_page == 'education'
        render :education, status: :unprocessable_entity
      elsif @current_page == 'certifications'
        render :certifications, status: :unprocessable_entity
      else @current_page == 'languages'
        render :languages, status: :unprocessable_entity
      end
    end
  end

  def experiences
    @profile = current_user.profile
    if @profile
      @profile.experiences.build unless @profile.experiences.present?
    else
      redirect_to new_profile_path, alert: 'fill your basic info first!'
    end
  end

  def education
    @profile = current_user.profile
    if @profile
      @profile.education_histories.build unless @profile.education_histories.present?
    else
      redirect_to new_profile_path, alert: 'fill your basic info first!'
    end
  end

  def certifications
    @profile = current_user.profile
    if @profile
      @profile.certifications.build unless @profile.certifications.present?
    else
      redirect_to new_profile_path, alert: 'fill your basic info first!'
    end
  end

  def languages
    @profile = current_user.profile
    if @profile
      @profile.languages.build unless @profile.languages.present? 
    else
      redirect_to new_profile_path, alert: 'fill your basic info first!'
    end
  end

  # def create_experiences
  #   profile = current_user.profile
  #   @experience = profile.experiences.build(experiences_params)
  #   if @experience.save
  #     redirect_to root_path
  #   else
  #     render :new_experiences, status: :unprocessable_entity
  # end
  private

    def profile_params
      @current_page = params[:profile][:current_page]
      params.require(:profile).permit(:professional_role, :bio, :hourly_rate, :postal_code, :phone, :country, :street_address, :city, :state, :skill_list,
      :service_list, experiences_attributes: [:id, :company, :title, :location, :country, :start_date, :end_date, :description, :_destroy], 
      education_histories_attributes: [:id, :school, :degree, :study_field, :from, :to, :description, :_destroy],
      languages_attributes: [:id, :name, :proficiency, :_destroy], 
      certifications_attributes: [:id, :issue_date, :expiration_date, :cert_id, :certification_url, :_destroy])
    end
end