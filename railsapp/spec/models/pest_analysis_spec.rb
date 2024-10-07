require 'rails_helper'

RSpec.describe PestAnalysis, type: :model do
  describe 'バリデーションのテスト' do
    let(:project) { Project.create!(title: 'テストプロジェクト', user: User.create!(name: '山田 太郎', email: 'yamada@example.com', password: 'password123')) }

    it 'プロジェクトがあり、有効なPestAnalysisは作成できる' do
      pest_analysis = PestAnalysis.new(
        project: project,
        political_factors: '政治的要因',
        economic_factors: '経済的要因',
        social_factors: '社会的要因',
        technological_factors: '技術的要因',
        memo: 'メモ'
      )
      expect(pest_analysis).to be_valid
    end

    it 'プロジェクトがない場合は無効' do
      pest_analysis = PestAnalysis.new(
        political_factors: '政治的要因',
        economic_factors: '経済的要因',
        social_factors: '社会的要因',
        technological_factors: '技術的要因',
        memo: 'メモ'
      )
      expect(pest_analysis).to_not be_valid
    end

    it 'メモがなくても有効' do
      pest_analysis = PestAnalysis.new(
        project: project,
        political_factors: '政治的要因',
        economic_factors: '経済的要因',
        social_factors: '社会的要因',
        technological_factors: '技術的要因'
      )
      expect(pest_analysis).to be_valid
    end
  end

  describe 'データベースのカラム確認' do
    it { should have_db_column(:project_id).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:political_factors).of_type(:text) }
    it { should have_db_column(:economic_factors).of_type(:text) }
    it { should have_db_column(:social_factors).of_type(:text) }
    it { should have_db_column(:technological_factors).of_type(:text) }
    it { should have_db_column(:memo).of_type(:text) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'アソシエーションのテスト' do
    it { should belong_to(:project) }
  end

  describe 'インデックスの確認' do
    it { should have_db_index(:project_id) }
  end
end
