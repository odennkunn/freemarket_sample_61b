class Image < ApplicationRecord
  belongs_to :item, inverse_of: :images
  belongs_to :item, optional: true
end
