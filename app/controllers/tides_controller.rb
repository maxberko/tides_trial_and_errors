class TidesController < ApplicationController
  before_action :set_tide, only: %i[ show edit update destroy ]

  # GET /tides or /tides.json
  def index
    @tides = Tide.all
  end

  # GET /tides/1 or /tides/1.json
  def show
  end

  # GET /tides/new
  def new
    @tide = Tide.new
  end

  # GET /tides/1/edit
  def edit
  end

  # POST /tides or /tides.json
  def create
    @tide = Tide.new(tide_params)

    respond_to do |format|
      if @tide.save
        format.html { redirect_to tide_url(@tide), notice: "Tide was successfully created." }
        format.json { render :show, status: :created, location: @tide }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tides/1 or /tides/1.json
  def update
    respond_to do |format|
      if @tide.update(tide_params)
        format.html { redirect_to tide_url(@tide), notice: "Tide was successfully updated." }
        format.json { render :show, status: :ok, location: @tide }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tides/1 or /tides/1.json
  def destroy
    @tide.destroy

    respond_to do |format|
      format.html { redirect_to tides_url, notice: "Tide was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tide
      @tide = Tide.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tide_params
      params.fetch(:tide, {})
    end
end
