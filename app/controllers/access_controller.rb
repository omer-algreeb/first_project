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
    
    respond_to do |format|
      format.json {render json: @user} 
      format.pdf do
        pdf_html = ActionController::Base.new.render_to_string(template: 'access/index')
        pdf = WickedPdf.new.pdf_from_string(pdf_html)
        send_data pdf, filename: 'hg.pdf'
      end
    end
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
