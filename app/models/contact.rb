# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  phone      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#  email      :string(255)
#  title      :string(255)
#  account_id :integer
#

class Contact < ActiveRecord::Base
  #associations
  belongs_to :account

  #before filters
  before_save { email.downcase! }

  #validations

  validates :name, :title,
    presence: true, 
    length: { minimum: 3, maximum: 50 }
  # VALID_PHONE = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
  VALID_PHONE = /\A(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?\z/
  validates :phone, presence: true, 
              format: { with: VALID_PHONE }
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, 
    presence: true,
    format: { with: VALID_EMAIL },
    uniqueness: { case_sensitive: false } 

end
