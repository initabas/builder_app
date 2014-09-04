class Job < ActiveRecord::Base
	resourcify
	has_one :location
	has_many :skills
	has_many :hires, :dependent => :destroy
	has_many :workers, :through => :hires
	has_many :activities, :as => :trackable
	belongs_to :user
	scope :with_hires, ->(accepted) { includes(:hires).joins(:skills).where("hires.accepted" => accepted ) }
end
