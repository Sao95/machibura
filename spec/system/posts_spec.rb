require 'rails_helper'

describe '投稿のテスト' do
  describe "投稿画面(posts_new_path)のテスト" do
    before do
      visit new_post_path
    end
    context '表示の確認' do
      it 'posts_new_pathが"/posts/new"であるか' do
        expect(current_path).to eq('/posts/new')
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_button '投稿'
      end
    end
    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'post[place]', with: Faker::Lorem.characters(number:5)
        fill_in 'post[writings]', with: Faker::Lorem.characters(number:20)
        click_button '投稿'
        expect(page).to have_current_path posts_path(Post.last)
      end
    end
  end

  describe "詳細画面のテスト" do
    before do
      visit '/posts/:id'
    end
  end
end