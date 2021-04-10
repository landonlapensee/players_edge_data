class TeamsController < ApplicationController
  def new
    @leauge = Leauge.find(params[:leauge_id])
    @team = Team.new
  end 

  def create
    @leauge = Leauge.find(params[:leauge_id])
    @team = Team.new(team_params)
    @team.leauge = @leauge

    if @team.save
      redirect_to leauge_path(@leauge)
    else
      render :new
    end

  end 

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
