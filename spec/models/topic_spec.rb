RSpec.describe 'Topicモデルのテスト', type: :model do
  describe 'バリテーションのテスト' do
    let(:user) { create(:user) }
    let!(:topic) { build(:topic, user_id: user.id) }

    context 'titleカラム' do
      it 'titleが存在しないので保存されない' do
        topic = Topic.new(title: '')
        expect(topic).not_to be_valid
      end
      it 'titleが50文字以下であること' do
        topic.title = Faker::Lorem.characters(number:51)
        expect(topic.valid?).to eq false;
      end
    end
  end
end