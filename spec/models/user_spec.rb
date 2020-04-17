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
      it 'nameが存在しないので保存されない' do
        user = User.new(email: 'aaa@aaaa', password: '111111')
        expect(user).not_to be_valid
      end
      it 'nameが1文字以上であること' do
        test_user.name = Faker::Lorem.characters(number:0)
        is_expected.to eq false;
      end
      it 'nameが20文字以下であること' do
        test_user.name = Faker::Lorem.characters(number:21)
        is_expected.to eq false;
      end
    end

    context 'introductionカラム' do
      let(:test_user) { user }
      it 'introductionが100文字以下であること' do
        test_user.introduction = Faker::Lorem.characters(number:101)
        is_expected.to eq false
      end
    end
    context 'like_ageカラム' do
      let(:test_user) { user }
      it 'like_ageが100文字以下であること' do
        test_user.introduction = Faker::Lorem.characters(number:101)
        is_expected.to eq false
      end
    end
    context 'like_bushoカラム' do
      let(:test_user) { user }
      it 'like_bushoが100文字以下であること' do
        test_user.introduction = Faker::Lorem.characters(number:101)
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
    context 'Topicモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:topics).macro).to eq :has_many
      end
    end
    context 'Topic_commentsモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:topic_comments).macro).to eq :has_many
      end
    end
    context 'Messagesモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:messages).macro).to eq :has_many
      end
    end
    context 'Favoritesモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'Entriesモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:entries).macro).to eq :has_many
      end
    end
  end
end
# アソシエーションのテスト