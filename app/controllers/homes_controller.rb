class HomesController < ApplicationController

  def top # トップ
      if user_signed_in?
         redirect_to user_path(current_user)
      end
  end

  def about # アバウトページ
      if user_signed_in?
         redirect_to user_path(current_user)
      end
  end

end
