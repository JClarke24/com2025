class Picture < ApplicationRecord
  belongs_to :album
  validates :album, :title, :date, presence: true
end
