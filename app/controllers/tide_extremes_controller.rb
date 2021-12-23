class TideExtremesController < ApplicationController
  before_action :set_tide_extreme, only: %i[ show edit update destroy ]

  # GET /tide_extremes or /tide_extremes.json
  def index
    @tide_extremes = TideExtreme.all
  end

  # GET /tide_extremes/1 or /tide_extremes/1.json
  def show
  end

  # GET /tide_extremes/new
  def new
    @tide_extreme = TideExtreme.new
  end

  # GET /tide_extremes/1/edit
  def edit
  end

  # POST /tide_extremes or /tide_extremes.json
  def create
    @tide_extreme = TideExtreme.new(tide_extreme_params)

    respond_to do |format|
      if @tide_extreme.save
        format.html { redirect_to tide_extreme_url(@tide_extreme), notice: "Tide extreme was successfully created." }
        format.json { render :show, status: :created, location: @tide_extreme }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tide_extreme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tide_extremes/1 or /tide_extremes/1.json
  def update
    respond_to do |format|
      if @tide_extreme.update(tide_extreme_params)
        format.html { redirect_to tide_extreme_url(@tide_extreme), notice: "Tide extreme was successfully updated." }
        format.json { render :show, status: :ok, location: @tide_extreme }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tide_extreme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tide_extremes/1 or /tide_extremes/1.json
  def destroy
    @tide_extreme.destroy

    respond_to do |format|
      format.html { redirect_to tide_extremes_url, notice: "Tide extreme was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tide_extreme
      @tide_extreme = TideExtreme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tide_extreme_params
      params.require(:tide_extreme).permit(:type, :time, :height)
    end
end
