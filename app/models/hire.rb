class Hire < ActiveRecord::Base
	belongs_to :job
	belongs_to :worker
	belongs_to :user
	has_many :activities, :as => :trackable
	scope :accepted_jobs, ->(accepted) { where(accepted: accepted) }
end
