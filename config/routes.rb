Rails.application.routes.draw do
  # まだ設定をしていない場合は、いくつかの設定を手動で行う必要があります。
  # routes.rb で生成されたコントローラのルートをオーバーライドしていることを確認してください。 例えば、以下のようにします。
  #   Rails.application.routes.draw do
  #     devise_for :users, controllers. {
  #       sessions: 'users/sessions'
  #     }
  #   end
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlock => 'users/unclock',
  }

  devise_scope :user do
    root :to => 'users/sessions#new'
    get 'signup', :to => 'users/registrations#new'
    get 'verify', :to => 'users/registrations#verify'
    get 'login', :to => 'users/sessions#new'
    get 'logout', :to => 'users/sessions#destroy'
  end
end
