FactoryBot.define do
  factory :asset do
    site
    type { 'VideoAsset' }
    sequence(:rel_order) {|n| n}
    filename { "video_#{ rel_order }.mp4" }
  end
end
