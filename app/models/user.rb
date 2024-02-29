class User < ApplicationRecord
   has_one :room
   has_many :requests
   has_many :user_files
end
