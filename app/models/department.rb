class Department < ActiveRecord::Base

   #-------------------------------------Description-------------------------------------------#

  #This is a data structure which is used to capture all departments in an organization.
  #Each user belongs to a department and each department has many users and one in-charge

  #-------------------------------------***********-------------------------------------------#

  has_many :users,:dependent => :destroy
  has_many :teams,:dependent => :destroy

  def create_team
    team=Team.new
    team.name=self.name+"_defaultteam"
    team.department_id=self.id
    team.save!

  end
end
