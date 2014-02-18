# No need for a session model, sessions are stored in cookies, not the database
class Session < ActiveRecord::Base
end
