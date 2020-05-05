class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
                                                        :nickname,             
                                                        :email,                                                                       
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
                                                        :adress_family_pseudonym, 
                                                        :post_code,           
                                                        :prefecture,           
                                                        :city,                 
                                                        :address_name,         
                                                        :building_name,     
                                                        :phone_number])
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
