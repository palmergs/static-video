FactoryBot.define do
  factory :site do
    sequence(:title) {|n| "Title #{ n }" }
    background { "#{ title.downcase.underscore }.jpg" }
  end
end
