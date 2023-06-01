class SamplesController < ApplicationController
  

  def index
    authorize Sample
  end
end
