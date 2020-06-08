class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!
  
  def index
    @pagy, @users = pagy(User.all.order('created_at DESC'), page: params[:page], items: 10)
  end

  def show
  end

  def edit
    #@receipts= Receipt.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: t('controllers.users.notifications.created_successfully') }
        format.json { render :show, status: :created, location: @payment }
        UserMailer.with(user: @user).welcome_email.deliver_later
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t('controllers.users.notifications.updated_successfully') }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :iban, :name, :cellphone, :service_tax, :business_name)
    end
end
