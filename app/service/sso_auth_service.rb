class SsoAuthService
	attr_reader :decrypt_params
	def initialize(params={})
		@params = params
	end

	def valid?
		 client_app.present? && auth_valid?  
	end

	def auth_valid?
		
		@decrypt_params = {}
		data = Aes::decrypt(@params[:data], "b23b7575e1a591cda109f3d1bb4c1212cb492aabc328e82e28bc78ff2fcb7ac0")
		params_data = data.split("||")
		params_data.each do |d|
			key,val = d.split("=")
			@decrypt_params[key] = val
		end
		time_in_utc <= (Time.at(@decrypt_params["time"].to_i)+ 1.minutes).getutc   rescue false
	end

	def param_valid?
		@params[:email].present? || @params[:timestamp].present? || @params[:hash].present?
	end

	def gen_hash_from_params_hash
  	digest  = OpenSSL::Digest::Digest.new('MD5')
   	OpenSSL::HMAC.hexdigest(digest,client_app.shared_key,@params[:email]+@params[:timestamp])
	end

	def subdomain_url
		subdomain = client_app.subdomain if client_app.present?
		"#{subdomain}.lvh.me"if subdomain.present?
	end

	def client_app
		ClientApp.where(:tenant_name=>Apartment::Tenant.current).last
	end

	def time_in_utc
		Time.now.getutc
	end
end