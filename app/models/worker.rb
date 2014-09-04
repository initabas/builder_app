class Worker < ActiveRecord::Base
	has_one :user, :as => :rolable
	accepts_nested_attributes_for :user
	has_many :skills
	has_many :hires
	has_many :jobs, :through => :hires
end
