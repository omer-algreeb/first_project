class AccessController < ApplicationController

  def register 
    @user = User.create(user_parames)
    if @user.save 
      response = { message: 'User created successfully'}
      render json: response, status: :created
    else
      render json: @user.errors , status: :bad
    end
  end


  def index
    @user = User.all
    render json: @user
  end

  def login 
    if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email]).first
      
      if found_user 
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    
    if authorized_user
      session[:user_id] = authorized_user.id
      render json: authorized_user
    else 
      response = { message: 'User not foend'}
      render json: response
    end
  end

  private

  def user_parames
    params.permit(:name, :email, :password)
  end

end
