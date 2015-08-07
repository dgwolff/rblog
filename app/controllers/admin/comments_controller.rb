class Admin::CommentsController < Admin::ApplicationController
  before_action :logged_in?
  
  def destroy
  end
end
