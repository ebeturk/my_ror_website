class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable
  enum category: { philosophy: 0, politics: 1, ethics: 2, psychology: 3, nature: 4, epistemology: 5, technology: 6, aesthetics: 7 }
end
