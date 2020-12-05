class HomesController < ApplicationController

  def top#トップ画面
      if user_signed_in?
        redirect_to articles_path
      end
  end

  def about#Aboutページ
      if user_signed_in?
         redirect_to articles_path
      end
  end

end
