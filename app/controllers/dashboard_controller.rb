class DashboardController < ApplicationController

  before_action :require_user, only: [:index]

  def index
    @meets = Meet.all.order('date ASC').limit(5)
    @wods = Wod.all.order('date ASC').limit(5)
    @notices = Notice.all.order('updated_at ASC').limit(3)
  end
end
