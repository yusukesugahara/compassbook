require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    it '名前、メール、パスワードがある場合は有効' do
      user = User.new(name: '山田 太郎', email: 'yamada@example.com', password: 'password123')
      expect(user).to be_valid
    end

    it '名前がない場合は無効' do
      user = User.new(email: 'yamada@example.com', password: 'password123')
      expect(user).to_not be_valid
    end

    it 'メールがない場合は無効' do
      user = User.new(name: '山田 太郎', password: 'password123')
      expect(user).to_not be_valid
    end

    it 'パスワードがない場合は無効' do
      user = User.new(name: '山田 太郎', email: 'yamada@example.com')
      expect(user).to_not be_valid
    end

    it 'メールが重複している場合は無効' do
      User.create!(name: '山田 太郎', email: 'yamada@example.com', password: 'password123')
      user = User.new(name: '佐藤 花子', email: 'yamada@example.com', password: 'password456')
      expect(user).to_not be_valid
    end
  end

  describe 'データベースのカラム確認' do
    it { should have_db_column(:name).of_type(:string).with_options(null: false, default: '') }
    it { should have_db_column(:email).of_type(:string).with_options(null: false, default: '') }
    it { should have_db_column(:encrypted_password).of_type(:string).with_options(null: false, default: '') }
    it { should have_db_column(:reset_password_token).of_type(:string) }
    it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { should have_db_column(:remember_created_at).of_type(:datetime) }
  end

  describe 'インデックスの確認' do
    it { should have_db_index(:email).unique(true) }
    it { should have_db_index(:reset_password_token).unique(true) }
  end
end
