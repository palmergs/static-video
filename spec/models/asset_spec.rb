require 'rails_helper'

RSpec.describe Asset, type: :model do
  it 'can be instantiated' do
    expect(Asset.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:video_asset)).to be_persisted
    expect(create(:image_asset)).to be_persisted
  end
end
