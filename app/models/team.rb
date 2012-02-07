class Team < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :department
  has_and_belongs_to_many :tests
end
