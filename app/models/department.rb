class Department < ActiveRecord::Base

  has_many :users,:dependent => :destroy
  has_many :teams,:dependent => :destroy

  def create_team
    team=Team.new
    team.name=self.name+"_defaultteam"
    team.department_id=self.id
    team.save!

  end
end
