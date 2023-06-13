class Freelancer::ProfileController < ApplicationController
  def new
    @profile = Profile.new
    @profile.experiences.build
  end
end
