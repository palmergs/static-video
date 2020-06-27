require 'rails_helper'

RSpec.describe Site, type: :model do
  it 'can be instantiated' do
    expect(Site.new).to_not be_nil
  end

  it 'can be persisted' do
    expect(create(:site)).to be_persisted
    expect(create(:site)).to be_persisted
  end
end
