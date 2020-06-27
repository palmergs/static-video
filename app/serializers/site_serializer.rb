class SiteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :subtitle, :descr, :background
  has_many :assets
end
