class UserAdminsController < ApplicationController
  before_action :set_user_admin, only: [:show, :update, :destroy]

  # GET /user_admins
  def index
    @user_admins = UserAdmin.all
    Resque.enqueue(SindEmailForAllUser)
    render json: @user_admins
  end

  # GET /user_admins/1
  def show
    render json: @user_admin
  end

  # POST /user_admins
  def create
    
    @user_admin = UserAdmin.new(user_admin_params)

    if @user_admin.save
      Resque.enqueue(SnippetHighlighter, @user_admin.id)
      render json: @user_admin, status: :created, location: @user_admin
    else
      render json: @user_admin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_admins/1
  def update
    if @user_admin.update(user_admin_params)
      render json: @user_admin
    else
      render json: @user_admin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_admins/1
  def destroy
    @user_admin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_admin
      @user_admin = UserAdmin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_admin_params
      params.permit(:name, :email, :phone, :password, :job_id)
    end
end
