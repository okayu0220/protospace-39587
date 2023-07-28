require 'rails_helper'

RSpec.describe Prototype, type: :model do
  before do
    @prototype = FactoryBot.build(:prototype)
  end

  describe 'プロトタイプの保存' do
    context '保存できる場合' do
      it 'title, catch_copy, concept, imageが存在すれば保存できる' do
        expect(@prototype).to be_valid
      end
    end

    context '保存できない場合' do
      it 'titleが空では保存できない' do
        @prototype.title = ""
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Title can't be blank")
      end
      it 'catch_copyが空では保存できない' do
        @prototype.catch_copy = ""
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Catch copy can't be blank")
      end
      it 'conceptが空では保存できない' do
        @prototype.concept = ""
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Concept can't be blank")
      end
      it 'imageが添付されていないと保存できない' do
        @prototype.image = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐づいていないと保存できない' do
        @prototype.user = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("User must exist")
      end
    end
  end
end
