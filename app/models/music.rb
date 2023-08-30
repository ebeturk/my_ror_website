class Music < ApplicationRecord
  enum music_type: { song: 0, snippet: 1 }
  has_one_attached :audio
end
