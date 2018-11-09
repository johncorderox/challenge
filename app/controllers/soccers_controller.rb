class SoccersController < ApplicationController
  before_action :set_soccer, only: [:show, :edit, :update, :destroy]

  # GET /soccers
  # GET /soccers.json
  def index
    @data = Soccer.all
    @soccers = Soccer.all

    @team = nil
    @score = nil
    @temp = nil

    # ABS for absolute value

    @data.each do |d|

      if @score == nil
        @team = d.name
        @score = d.for - d.against
        @name = d.name
        if @score < 0
          @score = @score.abs
        end
      else
        @temp = d.for - d.against
        if @temp < 0
          @temp = @temp.abs
        end
        if @temp < @score
          @score = @temp
          @name = d.name
        end
      end
  end
end

  # GET /soccers/1
  # GET /soccers/1.json
  def show
  end

  # GET /soccers/new
  def new
    @soccer = Soccer.new
  end

  # GET /soccers/1/edit
  def edit
  end

  # POST /soccers
  # POST /soccers.json
  def create
    @soccer = Soccer.new(soccer_params)

    respond_to do |format|
      if @soccer.save
        format.html { redirect_to @soccer, notice: 'Soccer was successfully created.' }
        format.json { render :show, status: :created, location: @soccer }
      else
        format.html { render :new }
        format.json { render json: @soccer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /soccers/1
  # PATCH/PUT /soccers/1.json
  def update
    respond_to do |format|
      if @soccer.update(soccer_params)
        format.html { redirect_to @soccer, notice: 'Soccer was successfully updated.' }
        format.json { render :show, status: :ok, location: @soccer }
      else
        format.html { render :edit }
        format.json { render json: @soccer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soccers/1
  # DELETE /soccers/1.json
  def destroy
    @soccer.destroy
    respond_to do |format|
      format.html { redirect_to soccers_url, notice: 'Soccer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soccer
      @soccer = Soccer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def soccer_params
      params.require(:soccer).permit(:name, :for, :against)
    end
end
