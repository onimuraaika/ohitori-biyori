require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user) }
  let!(:genre) { create(:genre)  }
  let!(:article) { build(:article, user_id: user.id, genre_id: genre.id) }

  describe '投稿機能のバリデーションチェックテスト' do
    subject { article.valid? }

    context "全て正しく入力してあるので保存される" do
      it { is_expected.to be_truthy }
    end
    context "画像を選択しないと保存されない" do
      before { article.image = nil }

      it { is_expected.to be_falsey }
    end
    context "タイトルが入力されていないと保存されない" do
      before { article.title = nil }

      it { is_expected.to be_falsey }
    end
    context "タイトルが20文字以内だと保存される" do
      before { article.title = 'あ' * 20 }

      it { is_expected.to be_truthy }
    end
    context "タイトルが21文字以上だと保存されない" do
      before { article.title = 'あ' * 21 }

      it { is_expected.to be_falsey }
    end
    context "ジャンルが選択されていないと保存されない" do
      before { article.genre = nil }

      it { is_expected.to be_falsey }
    end
    context "伝えたいことが入力されていないと保存されない" do
      before { article.body = nil }

      it { is_expected.to be_falsey }
    end
  end
end