class Site < ApplicationRecord
  has_many :assets, -> { order(rel_order: :desc) }, dependent: :destroy

  validates :title, presence: true
  validates :background, presence: true
end
