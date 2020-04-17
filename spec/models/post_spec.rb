require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリテーションのテスト' do
    let(:user) { create(:user) }
    let!(:post) { build(:post, user_id: user.id) }

    context 'place_nameカラム' do
      it 'place_nameが存在しないので保存されない' do
        post = Post.new(title: 'aaaaaaa', content: 'aaaaaaa')
        expect(post).not_to be_valid
      end
      it 'place_nameが20文字以下であること' do
        post.place_name = Faker::Lorem.characters(number:21)
        expect(post.valid?).to eq false;
      end
    end
    context 'titleカラム' do
      it 'titleが存在しないので保存されない' do
        post = Post.new(place_name: 'aaaaaaa', content: 'aaaaaaa')
        expect(post).not_to be_valid
      end
      it 'titleが20文字以下であること' do
        post.title = Faker::Lorem.characters(number:21)
        expect(post.valid?).to eq false;
      end
    end
    context 'contentカラム' do
      it 'contentが存在しないので保存されない' do
        post = Post.new(place_name: 'title', content: 'aaaaaaa')
        expect(post).not_to be_valid
      end
      it 'contentが200文字以下であること' do
        post.content = Faker::Lorem.characters(number:201)
        expect(post.valid?).to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end
end