# 画像のアップロード先を変更
# デフォルトではtmp/uploads/storeにアップロードされる
Refile.backends['store'] = Refile::Backend::FileSystem.new('public/uploads/')