# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def sign_up
  #   user = User.new
  # end


  def create
    user = User.create(user_params)
    logger.debug user.errors.inspect
    if user.invalid?
      flash[:alert] = "ブラウザの「戻る」を押し、入力内容を再度ご確認ください。"
      redirect_to new_user_registration_path
    else
      sign_up(user, current_user)
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :first_name,           
      :family_name,          
      :family_name_pseudonym,  
      :first_name_pseudonym,
      :birth_year,           
      :birth_month,          
      :birth_day,            
      :introduction,
      :avatar,
      :address_first_name,   
      :address_family_name,  
      :address_first_pseudonym, 
      :address_family_pseudonym, 
      :post_code,           
      :prefecture,           
      :city,                 
      :address_name,         
      :building_name,     
      :phone_number    
    )
  end
end


      # session[:nickname] = user_params[:nickname]
      # session[:email] = user_params[:email]
      # session[:password] = user_params[:password]
      # session[:family_name] = user_params[:family_name]
      # session[:first_name] = user_params[:first_name]
      # session[:last_name_pseudonym] = user_params[:last_name_pseudonym]
      # session[:first_name_pseudonym] = user_params[:first_name_pseudonym]
      # session[:birth_year] = user_params[:"birth_year(1i)"].to_i
      # session[:birth_month] = user_params[:"birth_month(2i)"].to_i
      # session[:birth_day] = user_params[:"birth_day(1i)"].to_i

      # session[:address_first_name] = user_params[:address_first_name]
      # session[:address_family_name] = user_params[:address_family_name]
      # session[:address_first_pseudonym] = user_params[:address_first_pseudonym]
      # session[:address_family_pseudonym] = user_params[:address_family_pseudonym]
      # session[:post_code] = user_params[:post_code]
      # session[:prefecture] = user_params[:prefecture]
      # session[:city] = user_params[:city]
      # session[:address_name] = user_params[:address_name]


      # session[:errorname] = user.errors.messages[:nickname].first
      # session[:errormail] = user.errors.messages[:email].first
      # session[:errorpassword] = user.errors.messages[:password].first
      # session[:errorfirstname] = user.errors.messages[:first_name].first
      # session[:errorfamilyname] = user.errors.messages[:family_name].first
      # session[:errorfirstname_pseudonym] = user.errors.messages[:first_name_pseudonym].first
      # session[:errorfamilyname_pseudonym] = user.errors.messages[:family_name_pseudonym].first
      # session[:errorbirth_year] = user.errors.messages[:birth_year].first
      
      # session[:erroraddressfirstname] = user.errors.messages[:address_first_name]
      # session[:erroraddressfamilyname] = user.errors.messages[:address_family_name]
      # session[:erroraddressfirst_pseudonym] = user.errors.messages[:address_first_pseudonym]
      # session[:erroraddressfamily_pseudonym] = user.errors.messages[:address_family_pseudonym]
      # session[:errorpostcode] = user.errors.messages[:post_code]
      # session[:errorprefecture] = user.errors.messages[:prefecture]
      # session[:errorcity] = user.errors.messages[:city]
      # session[:erroraddressname] = user.errors.messages[:address_name]
  
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end


