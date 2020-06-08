<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :authenticate_user!
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]

  # GET <%= route_url %>
  def index
    @pagy, @<%= plural_table_name %>  = pagy(<%= orm_class.all(class_name) %>.order('created_at DESC'), page: params[:page], items: 10)
    respond_to do |format|
      format.html
      format.json { render json: @<%= plural_table_name %>.as_json}
    end
  end

  # GET <%= route_url %>/1
  def show
    respond_to do |format|
      format.html
      format.json { render json: @<%= singular_table_name %>.as_json}
    end
  end

  # GET <%= route_url %>/new
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    respond_to do |format|
      format.html
      format.json { render json: @<%= singular_table_name %>.as_json}
    end
  end

  # GET <%= route_url %>/1/edit
  def edit
    respond_to do |format|
      format.html
      format.json { render json: @<%= singular_table_name %>.as_json}
    end
  end

  # POST <%= route_url %>
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>
    respond_to do |format|
      if @<%= orm_instance.save %>
        format.html { redirect_to <%= singular_table_name %>_url(@<%= singular_table_name %>), notice: '<%= singular_table_name.capitalize.humanize %> registado com sucesso' }
        format.json { render json: @<%= singular_table_name %>.as_json}
      else
        format.html { render :new }
        format.json { render json: @<%= singular_table_name %>.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    respond_to do |format|
      if @<%= orm_instance.update("#{singular_table_name}_params") %>
        format.html { redirect_to <%= singular_table_name %>_url(@<%= singular_table_name %>), notice: '<%= singular_table_name.capitalize.humanize %> actualizado com sucesso' }
        format.json { render json: @<%= singular_table_name %>.as_json}
      else
        format.html { render :edit }
        format.json { render json: @<%= orm_instance.errors %>, status: :unprocessable_entity }
      end
    end
  end

  # DELETE <%= route_url %>/1
  def destroy
    @<%= orm_instance.destroy %>

    respond_to do |format|
      format.html { redirect_to <%= index_helper %>_url, notice: '<%= singular_table_name.capitalize.humanize %> eliminado com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      id = params[:id]
      redirect_to <%= index_helper %>_url, notice: 'Erro ao aceder o recurso <%= singular_table_name.humanize %>' and return unless id.present?
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "id") %>
    end

    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_table_name}_params" %>
      params.require(:<%= singular_table_name %>).permit(<%= (attributes_names.map { |name| ":#{name}" }).join(', ') %>, :link_anterior)
    end
end
<% end -%>
