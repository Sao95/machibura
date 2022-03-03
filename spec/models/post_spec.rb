require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post.valid? }

    let(:user) { create(:user) }
    let!(:post) { build(:post, user_id: user.id) }

    context 'placeカラム' do
      it '空欄でないこと' do
        post.place = ''
        is_expected.to eq false
      end
    end

    context 'writingsカラム' do
      it '空欄でないこと' do
        post.writings = ''
        is_expected.to eq false
      end
    end
  end


end