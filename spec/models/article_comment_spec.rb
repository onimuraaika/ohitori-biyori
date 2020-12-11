require 'rails_helper'

RSpec.describe ArticleComment, type: :model do
  let!(:user) { create(:user) }
  let!(:genre) { create(:genre)  }
  let!(:article) { create(:article, user_id: user.id, genre_id: genre.id) }
  let!(:article_comment) { build(:article_comment, user_id: user.id, article_id: article.id) }

  describe 'コメント送信機能のバリデーションチェックテスト' do
    subject { article_comment.valid? }

    context "コメントが50文字以内だと送信される" do
      before { article_comment.comment = 'あ' * 50 }

      it { is_expected.to be_truthy }
    end
    context "タイトルが51文字以上だと送信されない" do
      before { article_comment.comment = 'あ' * 51 }

      it { is_expected.to be_falsey }
    end
  end
end