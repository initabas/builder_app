class Skill < ActiveRecord::Base
	belongs_to :worker
	belongs_to :job
end
