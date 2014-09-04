class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def track_activity(trackable, trackable_for, action = params[:action])
  	current_user.activities.create! action: action, trackable: trackable, trackable_for: trackable_for
  	@user = User.find_by_id(trackable_for)
  	@user.increment(:pending_notification)
		@user.save
  end
end
