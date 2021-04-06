class LeaugesController < ApplicationController
  before_action :set_leauge, only: %i[ show edit update destroy ]

  # GET /leauges or /leauges.json
  def index
    @leauges = Leauge.all
  end

  # GET /leauges/1 or /leauges/1.json
  def show
    set_leauge
  end

  # GET /leauges/new
  def new
    @leauge = Leauge.new
  end

  # GET /leauges/1/edit
  def edit
    set_leauge
  end

  # POST /leauges or /leauges.json
  def create
    @leauge = Leauge.new(leauge_params)
    @leauge.user = current_user
    @leauge.save

    if @leauge.save
      redirect_to leauges_path, notice: "Your leauge has been created"
    else
      render :new
    end
  end

  # PATCH/PUT /leauges/1 or /leauges/1.json
  def update
    set_leauge
    @leauge.update(leauge_params)
    
    redirect_to @leauge, notice: "Your leauge has been edited"
  end

  # DELETE /leauges/1 or /leauges/1.json
  def destroy
    set_leauge
    @leauge.destroy

    redirect_to leauges_path, notice: "Your leauge has been deleted"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leauge
      @leauge = Leauge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leauge_params
      params.require(:leauge).permit(:name)
    end
end
