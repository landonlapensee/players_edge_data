class PlayersController < ApplicationController
  def new
    @player = Player.new
    @teams = Team.where(leauge_id: params[:leauge])
    @projection = Projection.find(params[:projection])
  end 
  
  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to leauge_path(@player.team.leauge) 
    else 
      render :new
    end
  end 

  def destroy
    set_player
    @player.destroy

    redirect_to leauge_path(@player.team.leauge), notice: "Player has been removed"
  end 

  private

  def set_player
    @player = Player.find(params[:id])
  end 

  def player_params
    params.require(:player).permit(:team_id, :projection_id)
  end
end
