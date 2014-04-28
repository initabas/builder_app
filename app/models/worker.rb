class Worker < ActiveRecord::Base
	has_one :user, :as => :rolable
end
