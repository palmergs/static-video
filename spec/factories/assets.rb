FactoryBot.define do
  factory :image_asset do
    site
    sequence(:rel_order) {|n| n }
    filename { "image_#{ rel_order }.jpg" }
  end

  factory :video_asset do
    site
    sequence(:rel_order) {|n| n }
    filename { "video_#{ rel_order }.mp4" }
  end
end
