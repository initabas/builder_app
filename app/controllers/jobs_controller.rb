class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.with_hires(nil).all
  end
  
  def accepted_jobs
  	if params[:skill_id].present?
			@skills = Skill.all
			@jobs = Job.includes(:skills, :hires).where("skills.id" => params[:skill_id], "hires.accepted" => true)
		else
			@jobs = Job.includes(:hires).where("hires.accepted" => true)
  	end
  	
  	respond_to do |format|
    	format.html
      format.js
    end
  end
	
	def nill
		@hires = Hire.all
		@hires.each do |hire|
			hire.accepted = nil
			hire.save
		end
	end
	
	def add_feedback
		@job = Job.find(params[:job_id])
		respond_to do |format|
      format.js
    end
	end
	
	def hire
		@job = Job.find(params[:job_id])
		unless @job.hires.map(&:worker_id).include? current_user.rolable.id
			@hire = @job.hires.build(:job_id => @job.id, :worker_id => current_user.rolable.id)
		end
		if @hire.save
			track_activity @job, @job.user
      respond_to do |format|
        format.js
      end
    end
	end
	
	def hired_jobs
# 		@jobs = Job.includes(:workers).where(:workers => { :user_id => current_user.id })
 #   @jobs = Job.with_hired_worker(current_user)
   # @hires = Hire.includes(:workers => ).where(:workres => {:user => current_user.id}) 
   @hires = current_user.rolable.hires.all
	end
	
	def accept
		@hire = Hire.find(params[:id])
		@hire.accepted = true
		if @hire.save && !(@hire.worker.user.id == current_user.id)
			@hires = Hire.where(:job_id => @hire.job_id).where(:accepted => nil).all
			@hires.each do |hire|
				hire.accepted = false
				hire.save
			end
      respond_to do |format|
        format.html {redirect_to :back, notice: "Liked!"}
        format.js
      end
    end
	end
	
  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = current_user.jobs.new(job_params)
    respond_to do |format|
      if @job.save
      	track_activity @job
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
			params.require(:job).permit(:user_id, :pendig_notification, :trackable, :feedback, :name, :title, :description, :start_date, skill_ids: [])
    end
    
    def find_jobs
			jobs = Job.order(:create_date)
			
		end
end
