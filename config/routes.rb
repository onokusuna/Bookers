Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # booksはcontroller名称、topはaction名称
  # ルートパスはRails内部のRuby記述部分で root_path と書けば指定できる
  root :to => 'books#top'
  resources :books
end
