class MunicipiosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_municipio, only: [:show, :edit, :update, :destroy]

  # GET /municipios
  def index
    @pagy, @municipios  = pagy(Municipio.all.order('created_at DESC'), page: params[:page], items: 10)
    respond_to do |format|
      format.html
      format.json { render json: @municipios.as_json}
    end
  end

  # GET /municipios/1
  def show
    respond_to do |format|
      format.html
      format.json { render json: @municipio.as_json}
    end
  end

  # GET /municipios/new
  def new
    @municipio = Municipio.new
    respond_to do |format|
      format.html
      format.json { render json: @municipio.as_json}
    end
  end

  # GET /municipios/1/edit
  def edit
    respond_to do |format|
      format.html
      format.json { render json: @municipio.as_json}
    end
  end

  # POST /municipios
  def create
    @municipio = Municipio.new(municipio_params)
    respond_to do |format|
      if @municipio.save
        format.html { redirect_to municipio_url(@municipio), notice: 'Municipio registado com sucesso' }
        format.json { render json: @municipio.as_json}
      else
        format.html { render :new }
        format.json { render json: @municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /municipios/1
  def update
    respond_to do |format|
      if @municipio.update(municipio_params)
        format.html { redirect_to municipio_url(@municipio), notice: 'Municipio actualizado com sucesso' }
        format.json { render json: @municipio.as_json}
      else
        format.html { render :edit }
        format.json { render json: @municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /municipios/1
  def destroy
    @municipio.destroy

    respond_to do |format|
      format.html { redirect_to municipios_url, notice: 'Municipio eliminado com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipio
      id = params[:id]
      redirect_to municipios_url, notice: 'Erro ao aceder o recurso Municipio' and return unless id.present?
      @municipio = Municipio.find(id)
    end

    # Only allow a trusted parameter "white list" through.
    def municipio_params
      params.require(:municipio).permit(:nome, :provincia_id, :link_anterior)
    end
end
