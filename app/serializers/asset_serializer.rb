class AssetSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :site
  attributes :type, :alt, :filename, :rel_order
end
