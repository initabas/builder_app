class Filter < ActiveRecord::Base

private
	def find_jobs
		jobs = Job.order(:create_date)
		jobs = jobs.where(skill_id: skill_id) if skill_id.present?
	end
end
