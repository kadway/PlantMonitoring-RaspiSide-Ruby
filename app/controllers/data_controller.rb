class DataController < ApplicationController
  before_action :set_datum, only: [:show, :edit, :update, :destroy]
  after_action :reload_page, :only => :update
  # GET /data
  # GET /data.json
  def index
     @data = Datum.order(id: :desc).limit(6).each do |d| end
  end
  
  def reload_page
    index
  end
  
  # GET /data/1
  # GET /data/1.json
  def show
 #Thing.active.find_each(batch_size: 50000) { |t| puts t.id }
    @plant = Datum.where(alias: @datum.alias).order(id: :desc).limit(1000).each do |d| end
  #    @data = Datum.order(id: :desc).limit(50).each do |d| end
  end

  # GET /data/new
  def new
    @datum = Datum.new
  end

  # GET /data/1/edit
  def edit
  end

  # POST /data
  # POST /data.json
  def create
    @datum = Datum.new(datum_params)

    respond_to do |format|
      if @datum.save
        format.html { redirect_to @datum, notice: 'Datum was successfully created.' }
        format.json { render :show, status: :created, location: @datum }
      else
        format.html { render :new }
        format.json { render json: @datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data/1
  # PATCH/PUT /data/1.json
  def update
    respond_to do |format|
      if @datum.update(datum_params)
        format.html { redirect_to @datum, notice: 'Datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @datum }
      else
        format.html { render :edit }
        format.json { render json: @datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data/1
  # DELETE /data/1.json
  def destroy
    @datum.destroy
    respond_to do |format|
      format.html { redirect_to data_url, notice: 'Datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datum
      @datum = Datum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datum_params
      params.fetch(:datum, {})
    end
end
