class Department < ActiveRecord::Base

  has_many :users,:dependent => :destroy
  has_many :teams,:dependent => :destroy
end
