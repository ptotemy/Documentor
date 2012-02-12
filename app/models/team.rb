class Team < ActiveRecord::Base

   #-------------------------------------Description-------------------------------------------#

  #This is a group of employees within a department.
  #The department incharge can create a team and group employees accordingly.
  #Test is assigned to a team.
  #An employee can belong to many teams



  #-------------------------------------***********-------------------------------------------#
  has_and_belongs_to_many :users
  belongs_to :department
  has_and_belongs_to_many :tests
end
