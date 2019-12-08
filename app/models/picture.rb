class Picture < ApplicationRecord
  belongs_to :album
  validates :album, :title, :date, presence: true

  has_attached_file :image, styles: {large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end