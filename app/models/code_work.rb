class CodeWork < ApplicationRecord
  has_one_attached :image
  enum project_type: { lecture_notes: 0, github_repo: 1, web_app: 2, other: 3 }
end
