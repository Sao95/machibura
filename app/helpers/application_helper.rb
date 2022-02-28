module ApplicationHelper

  def user_name(user)
    #ログインしていないユーザーの表示名を設定
    return '街ブラさん' if user.nil?

    path = admin_signed_in? ? "/admin/users/#{user.id}" : "/users/#{user.id}"
    content_tag(:a, href: path) do
      concat user.name
    end
  end

end