class ProvinciasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_provincia, only: [:show, :edit, :update, :destroy]

  # GET /provincias
  def index
    @pagy, @provincias  = pagy(Provincia.all.order('created_at DESC'), page: params[:page], items: 10)
    respond_to do |format|
      format.html
      format.json { render json: @provincias.as_json}
    end
  end

  # GET /provincias/1
  def show
    respond_to do |format|
      format.html
      format.json { render json: @provincia.as_json}
    end
  end

  # GET /provincias/new
  def new
    @provincia = Provincia.new
    respond_to do |format|
      format.html
      format.json { render json: @provincia.as_json}
    end
  end

  # GET /provincias/1/edit
  def edit
    respond_to do |format|
      format.html
      format.json { render json: @provincia.as_json}
    end
  end

  # POST /provincias
  def create
    @provincia = Provincia.new(provincia_params)
    respond_to do |format|
      if @provincia.save
        format.html { redirect_to provincia_url(@provincia), notice: 'Provincia registado com sucesso' }
        format.json { render json: @provincia.as_json}
      else
        format.html { render :new }
        format.json { render json: @provincia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provincias/1
  def update
    respond_to do |format|
      if @provincia.update(provincia_params)
        format.html { redirect_to provincia_url(@provincia), notice: 'Provincia actualizado com sucesso' }
        format.json { render json: @provincia.as_json}
      else
        format.html { render :edit }
        format.json { render json: @provincia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provincias/1
  def destroy
    @provincia.destroy

    respond_to do |format|
      format.html { redirect_to provincias_url, notice: 'Provincia eliminado com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provincia
      id = params[:id]
      redirect_to provincias_url, notice: 'Erro ao aceder o recurso Provincia' and return unless id.present?
      @provincia = Provincia.find(id)
    end

    # Only allow a trusted parameter "white list" through.
    def provincia_params
      params.require(:provincia).permit(:nome, :pais_id, :link_anterior)
    end
end
