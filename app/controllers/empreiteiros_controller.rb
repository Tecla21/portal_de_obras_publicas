class EmpreiteirosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_empreiteiro, only: [:show, :edit, :update, :destroy]

  # GET /empreiteiros
  def index
    @pagy, @empreiteiros  = pagy(Empreiteiro.all.order('created_at DESC'), page: params[:page], items: 10)
    respond_to do |format|
      format.html
      format.json { render json: @empreiteiros.as_json}
    end
  end

  # GET /empreiteiros/1
  def show
    respond_to do |format|
      format.html
      format.json { render json: @empreiteiro.as_json}
    end
  end

  # GET /empreiteiros/new
  def new
    @empreiteiro = Empreiteiro.new
    respond_to do |format|
      format.html
      format.json { render json: @empreiteiro.as_json}
    end
  end

  # GET /empreiteiros/1/edit
  def edit
    respond_to do |format|
      format.html
      format.json { render json: @empreiteiro.as_json}
    end
  end

  # POST /empreiteiros
  def create
    @empreiteiro = Empreiteiro.new(empreiteiro_params)
    respond_to do |format|
      if @empreiteiro.save
        format.html { redirect_to empreiteiro_url(@empreiteiro), notice: 'Empreiteiro registado com sucesso' }
        format.json { render json: @empreiteiro.as_json}
      else
        format.html { render :new }
        format.json { render json: @empreiteiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empreiteiros/1
  def update
    respond_to do |format|
      if @empreiteiro.update(empreiteiro_params)
        format.html { redirect_to empreiteiro_url(@empreiteiro), notice: 'Empreiteiro actualizado com sucesso' }
        format.json { render json: @empreiteiro.as_json}
      else
        format.html { render :edit }
        format.json { render json: @empreiteiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empreiteiros/1
  def destroy
    @empreiteiro.destroy

    respond_to do |format|
      format.html { redirect_to empreiteiros_url, notice: 'Empreiteiro eliminado com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empreiteiro
      id = params[:id]
      redirect_to empreiteiros_url, notice: 'Erro ao aceder o recurso Empreiteiro' and return unless id.present?
      @empreiteiro = Empreiteiro.find(id)
    end

    # Only allow a trusted parameter "white list" through.
    def empreiteiro_params
      params.require(:empreiteiro).permit(:nome, :email, :telefone, :telemovel, :link_anterior)
    end
end
