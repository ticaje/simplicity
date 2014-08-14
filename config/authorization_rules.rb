authorization do
  role :admin do
    has_permission_on [:articles, :comments], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  role :guest do
    has_permission_on :articles, :to => [:index, :show]
    has_permission_on :translations, :to => [:index, :show]
    has_permission_on :comments, :to => [:new, :create]
    has_permission_on :comments, :to => [:edit, :update] do
      if_attribute :author => is { user }
    end
  end

  role :author do
    includes :guest
    has_permission_on :articles, :to => [:new, :create, :translate]
    has_permission_on :articles, :to => [:edit, :update, :destroy] do
      if_attribute :author => is { user }
    end
    has_permission_on :translations, :to => [:new, :create]
    has_permission_on :translations, :to => [:edit, :update, :destroy] do
      if_attribute :user => is { user }
    end
  end
end
