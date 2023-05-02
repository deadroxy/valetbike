class StationLocsController < ApplicationController
  before_action :set_station_loc, only: %i[ show edit update destroy ]

  # GET /station_locs or /station_locs.json
  def index
    if params[:place].present?
      @station_locs = StationLoc.near(params[:place], params[:distance] || 30, order: :distance)
    else
      @station_locs = StationLoc.all
    end
  end

  # GET /station_locs/1 or /station_locs/1.json
  def show
  end

  # GET /station_locs/new
  def new
    @station_loc = StationLoc.new
  end

  # GET /station_locs/1/edit
  def edit
  end

  # POST /station_locs or /station_locs.json
  def create
    @station_loc = StationLoc.new(station_loc_params)

    respond_to do |format|
      if @station_loc.save
        format.html { redirect_to station_loc_url(@station_loc), notice: "Station loc was successfully created." }
        format.json { render :show, status: :created, location: @station_loc }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @station_loc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /station_locs/1 or /station_locs/1.json
  def update
    respond_to do |format|
      if @station_loc.update(station_loc_params)
        format.html { redirect_to station_loc_url(@station_loc), notice: "Station loc was successfully updated." }
        format.json { render :show, status: :ok, location: @station_loc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @station_loc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /station_locs/1 or /station_locs/1.json
  def destroy
    @station_loc.destroy

    respond_to do |format|
      format.html { redirect_to station_locs_url, notice: "Station loc was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station_loc
      @station_loc = StationLoc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def station_loc_params
      params.require(:station_loc).permit(:name, :address, :longitude, :latitude)
    end
end
