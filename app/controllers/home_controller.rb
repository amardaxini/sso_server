class HomeController < ApplicationController
	 
  def index
  end

  def sso
  	# "http://localhost:3002" if params[:email].blank? || params[:timestamp].blank? || params[:hash].blank?
  	
  	sso_service  = SsoAuthService.new(params)

  	if sso_service.valid?
  		user = User.where(:email=>sso_service.decrypt_params["email"]).first
  		if user.blank?
  			generated_password = Devise.friendly_token.first(8)
				user = User.create!(:email => sso_service.decrypt_params["email"], :password => generated_password)

				
  		end
  		sign_in(user)
  		redirect_to tickets_path
  	else
  		redirect_to root_url,:notice=>"Authentication Fail"
  	end	
  	
  end

end
