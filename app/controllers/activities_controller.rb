class ActivitiesController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@activities = Activity.where(trackable_for: current_user.id).order("created_at DESC")
		@user = current_user
		@user.pending_notification = 0 unless @user.pending_notification == 0 || @user.pending_notification == nil
		@user.save
	end
	
end
