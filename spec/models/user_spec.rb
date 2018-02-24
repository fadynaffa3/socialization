require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:post)  { create(:post, user: user1) }

  describe 'associations' do
    it { is_expected.to have_many(:mentions) }
  end

  describe 'mentionable' do
    it 'will create mention when user1 mentions user2 on a post' do
      post.mention!(user1, user2)
    end
  end
end
