class UserResidence < ApplicationRecord
  belongs_to :user
  belongs_to :residence
end
