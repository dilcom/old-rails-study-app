class Admin < ActiveRecord::Base
  # Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Removed:  :registerable, :recoverable
  devise :database_authenticatable, :rememberable, :trackable, :validatable
end
