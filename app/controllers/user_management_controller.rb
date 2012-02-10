class UserManagementController < ApplicationController

  def index
    @department=Department.find(params[:dept_id])


  end

  def add_users


    @add=0


    @team=Team.find(params[:team_id])
    @department=@team.department

    @department.users.each do |user|
      @team_user=TeamsUsers.new

      if !params[user.id.to_s].nil?

        @team_user.user_id=user.id
        @team_user.team_id=@team.id
        @team_user.save!
      end
    end


    redirect_to user_management_path(:dept_id=>@team.department_id)

  end


  def get_available_users


    @team=Team.find(params[:team_id])
    @department=@team.department

    @users=@department.users-@team.users
    render :layout=>false
  end

  def get_team_users
    @team=Team.find(params[:team_id])
    @users=@team.users

    render :layout=>false
  end

  def remove_team_user
    @team=Team.find(params[:team_id])
    @user=User.find(params[:user_id])
    @team_user=TeamsUsers.find_by_team_id_and_user_id(@team.id, @user.id)
    @team_user.destroy
    redirect_to user_management_path(:dept_id=>@team.deptartment_id)
  end

  def department_management
    @departments=Department.find_all_by_incharge_user_id(current_user.id)

  end


end
