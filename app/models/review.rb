class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true, length: { minimum:15 }
end
