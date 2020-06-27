class Asset < ApplicationRecord
  belongs_to :site, counter_cache: true

  validates :filename, presence: true

  before_validation on: :create do
    self.rel_order = site.assets_count + 1
  end
end
