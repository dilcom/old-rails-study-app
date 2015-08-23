class Product < ActiveRecord::Base
  has_many :pictures, :dependent => :destroy
end
