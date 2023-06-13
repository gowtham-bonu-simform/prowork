class Freelancer::ProfileController < ApplicationController
  def new
    @profile = Profile.new
    @profile.experiences.build
    @profile.education_histories.build
    @profile.certifications.build
    2.times {@profile.languages.build}
  end
end
