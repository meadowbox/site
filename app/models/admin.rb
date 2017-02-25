class Admin < ActiveRecord::Base
  has_secure_password

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  before_validation :clean_data

  private

  def clean_data
    self.first_name = self.first_name.strip.capitalize
    self.last_name = self.last_name.strip.capitalize
    self.email = self.email.downcase.strip
  end
end
