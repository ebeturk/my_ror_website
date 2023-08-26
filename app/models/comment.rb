class Comment < ApplicationRecord
  belongs_to :article
  has_many :likes, as: :likable
end
