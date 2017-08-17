class NoticesController < ApplicationController

  before_action :require_user, except: []
  before_action :require_editor, only: [:edit, :create, :update]
  before_action :require_admin, only: [:destroy]
  before_action :all_notices, only: [:index, :create, :update, :destroy]
  before_action :set_notices, only: [:edit, :update, :destroy]
  respond_to :html, :js


  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.create(notice_params)
  end

  def update
    @notice.update_attributes(notice_params)
  end

  def destroy
    @notice.destroy
  end

  private


  def all_notices
    @notices = Notice.all
  end

  def set_notices
    @notice = Notice.find(params[:id])
  end

  def notice_params
    params.require(:notice).permit(:title, :content)
  end
end
