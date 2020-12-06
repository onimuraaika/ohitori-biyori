class HomesController < ApplicationController

  def top # トップ
      if user_signed_in?
         redirect_to articles_path
      end
  end

  def about # アバウトページ
      if user_signed_in?
         redirect_to articles_path
      end
  end

end
