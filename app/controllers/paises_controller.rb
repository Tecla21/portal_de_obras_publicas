class PaisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pais, only: [:show, :edit, :update, :destroy]

  # GET /paises
  def index
    @pagy, @paises  = pagy(Pais.all.order('created_at DESC'), page: params[:page], items: 10)
    respond_to do |format|
      format.html
      format.json { render json: @paises.as_json}
    end
  end

  # GET /paises/1
  def show
    respond_to do |format|
      format.html
      format.json { render json: @pais.as_json}
    end
  end

  # GET /paises/new
  def new
    @pais = Pais.new
    respond_to do |format|
      format.html
      format.json { render json: @pais.as_json}
    end
  end

  # GET /paises/1/edit
  def edit
    respond_to do |format|
      format.html
      format.json { render json: @pais.as_json}
    end
  end

  # POST /paises
  def create
    @pais = Pais.new(pais_params)
    respond_to do |format|
      if @pais.save
        format.html { redirect_to pais_url(@pais), notice: 'Pais registado com sucesso' }
        format.json { render json: @pais.as_json}
      else
        format.html { render :new }
        format.json { render json: @pais.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paises/1
  def update
    respond_to do |format|
      if @pais.update(pais_params)
        format.html { redirect_to pais_url(@pais), notice: 'Pais actualizado com sucesso' }
        format.json { render json: @pais.as_json}
      else
        format.html { render :edit }
        format.json { render json: @pais.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paises/1
  def destroy
    @pais.destroy

    respond_to do |format|
      format.html { redirect_to paises_url, notice: 'Pais eliminado com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pais
      id = params[:id]
      redirect_to paises_url, notice: 'Erro ao aceder o recurso Pais' and return unless id.present?
      @pais = Pais.find(id)
    end

    # Only allow a trusted parameter "white list" through.
    def pais_params
      params.require(:pais).permit(:nome, :link_anterior)
    end
end
