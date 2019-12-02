class ApplicationController < ActionController::Base
  before_action :set_current_user

  private

  def set_current_user
    @current_user ||= if cookies['name']
      User.find_or_create_by(name: cookies['name'])
    else
      user = User.all.sample
      cookies['name'] = user.name
      user
    end
  end
end
