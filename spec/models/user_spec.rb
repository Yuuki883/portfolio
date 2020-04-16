require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }
    context 'nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false;
      end
      it '1文字以上であること' do
        test_user.name = Faker::Lorem.characters(number:0)
        is_expected.to eq false;
      end
      it '20文字以下であること' do
        test_user.name = Faker::Lorem.characters(number:20)
        is_expected.to eq false;
      end
    end

    context 'introductionカラム' do
      let(:test_user) { user }
      it '100文字以下であること' do
        test_user.introduction = Faker::Lorem.characters(number:100)
        is_expected.to eq false
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
  end
end
# アソシエーションのテスト