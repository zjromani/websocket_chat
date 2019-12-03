module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = set_current_user
      logger.add_tags 'ActionCable', "User #{current_user.name}"
    end

    protected

    def set_current_user
      if cookies['name']
        User.find_by(name: cookies['name'])
      else
        user = User.all.sample
        cookies['name'] = user.name
        user
      end
    end
  end
end
