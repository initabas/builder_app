class UsersController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		@skills = Skill.all
		if params[:skill_id].present?
			@workers = Worker.includes(:skills).where("skills.id" => params[:skill_id]).all
		else
			@workers = Worker.all
		end
		respond_to do |format|
			format.html { render layout:"user_list" }
		end
	end
	
	def private_data
		respond_to do |format|
      format.js
    end
	end
	
	def hire_delete
		@hire = Hire.find(params[:hire_id]).destroy
    respond_to do |format|
      #format.html { redirect_to hired_jobs_url(current_user.id) }
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
	end
	
	def jobs
		@jobs = Job.where(:user_id => current_user.id)
	end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end
  
  
end
