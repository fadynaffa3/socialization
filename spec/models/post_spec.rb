require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user)   { create(:user) }
  let(:poster) { create(:user) }
  let(:post)   { create(:post, user: poster) }

  describe 'associations' do
    it { is_expected.to have_many(:tags) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'taggable' do
    it 'will create tag when user tags a post' do
      expect { user.tag!(post) }.to change { post.tags.count }.by(1)
    end
  end
end
