class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true

  #snscredentialモデル validation
  validates :uid, presence: true
  validates :provider, presence: true
  validates :user_id, presence: true
end
