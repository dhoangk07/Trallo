class DashboardsController < ApplicationController
  def index
  	@boards = Board.where(user_id: current_user.id)
  end
end
