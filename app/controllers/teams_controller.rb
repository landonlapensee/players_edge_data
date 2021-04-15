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

  def show
    set_team
  end

  def edit
    set_team
  end

  def update 
    set_team
    @team.update(team_params)
    
    redirect_to leauge_path(@team.leauge_id), notice: "Team has been edited"
  end

  def destroy
    set_team
    @leauge = @team.leauge
    @team.destroy

    redirect_to leauge_path(@leauge), notice: "Team has been deleted"
  end 
  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
