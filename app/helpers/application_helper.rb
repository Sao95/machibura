module ApplicationHelper
  
  def user_name(user)
    if user.nil?
      # ログインしていないユーザーの表示名を設定
      '街ブラさん'
    else
      # user.nameにユーザー詳細へのリンクを設定
      content_tag(:a, :href => "/users/#{user.id}") do
        concat user.name
      end
    end
  end
  
end