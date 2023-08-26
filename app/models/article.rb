class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable
  enum category: { philosophy: 0, politics: 1, ethics: 2, psychology: 3, nature: 4, epistemology: 5, technology: 6, aesthetics: 7 }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_content_and_summary,
                  against: { title: 'A', content: 'C', summary: 'B' },
                  using: {
                    tsearch: { prefix: true, dictionary: "english" },
                    trigram: { threshold: 0.1 }
                  }
end
