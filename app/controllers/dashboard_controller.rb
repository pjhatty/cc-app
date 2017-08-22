class DashboardController < ApplicationController

  before_action :require_user, only: [:index]

  def index
    meets = Meet.all.order('date ASC')
    wods = Wod.all.order('date ASC')
    @upcoming_meets = []
    @upcoming_wods = []
    @notices = Notice.all.order('updated_at ASC').limit(3)

    meets.each do |meet|
      today = Time.now.beginning_of_day.strftime("%s")
      @upcoming_meets << meet if meet.date.strftime("%s") > today
    end
    wods.each do |wod|
      today = Time.now.beginning_of_day.strftime("%s")
      @upcoming_wods << wod if wod.date.strftime("%s") > today
    end
    

  end
end
