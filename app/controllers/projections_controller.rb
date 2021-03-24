class ProjectionsController < ApplicationController
  def index
  @projections = Projection.all
  end  
end
