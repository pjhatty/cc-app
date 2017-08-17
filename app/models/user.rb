class User < ApplicationRecord

  has_secure_password


  def editor?
    self.role ||= 'none'
    self.role.split(' ').include? 'editor'
  end

  def admin?
    self.role ||= 'none'
    self.role.split(' ').include? 'admin'
  end
end
