class ClientApp < ActiveRecord::Base
	before_save :ensure_shared_key

	def ensure_shared_key
    if shared_key.blank?
      self.shared_key = generate_shared_key
    end
  end
  
  def generate_new_token!
    self.shared_key = generate_shared_key
    self.save!
  end
  
  private
  
  def generate_shared_key
    loop do
      token = SecureRandom.hex(32)
      break token unless ClientApp.where(shared_key: token).first
    end
  end       
end
