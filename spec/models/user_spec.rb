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
      expect { post.mention!(user1, user2) }.to change { user2.mentions.count }.by(1)
    end
  end
end
