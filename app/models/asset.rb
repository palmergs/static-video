class Asset < ApplicationRecord
  belongs_to :site, counter_cache: true

  validates :filename, presence: true

  before_validation on: :create do
    self.rel_order = site.assets_count + 1
  end

  scope :by_site, ->(site_id) { where(site_id: site_id.to_i) }
end
