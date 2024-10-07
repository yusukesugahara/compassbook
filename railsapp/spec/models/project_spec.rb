require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { User.create!(name: '山田 太郎', email: 'yamada@example.com', password: 'password123') }

    it 'ユーザーとタイトルがある場合は有効' do
      project = Project.new(user: user, title: 'プロジェクト名', description: 'プロジェクトの説明')
      expect(project).to be_valid
    end

    it 'タイトルがない場合は無効' do
      project = Project.new(user: user, description: 'プロジェクトの説明')
      expect(project).to_not be_valid
    end

    it 'ユーザーがない場合は無効' do
      project = Project.new(title: 'プロジェクト名', description: 'プロジェクトの説明')
      expect(project).to_not be_valid
    end

    it '説明がない場合でも有効' do
      project = Project.new(user: user, title: 'プロジェクト名')
      expect(project).to be_valid
    end
  end

  describe 'データベースのカラム確認' do
    it { should have_db_column(:title).of_type(:string).with_options(null: false) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:user_id).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'アソシエーションのテスト' do
    it { should belong_to(:user) }
  end

  describe 'インデックスの確認' do
    it { should have_db_index(:user_id) }
  end
end
