require 'rails_helper'
require 'pry'

describe User do
  describe '#create' do
    context 'can save' do
      it "is valid" do
        user = build(:user)
        user.valid?
        expect(user).to be_valid
      end

      it "is valid without a postal_code" do
        user = build(:user, postal_code: "124")
        user.valid?
        expect(user).to be_valid
      end

      it "is valid without a prefectures" do
        user = build(:user, prefectures: "124")
        user.valid?
        expect(user).to be_valid
      end

      it "is valid without a city" do
        user = build(:user, city: "")
        user.valid?
        expect(user).to be_valid
      end

      it "is valid without a street_address" do
        user = build(:user, street_address: "")
        user.valid?
        expect(user).to be_valid
      end

      it "is valid without a phone_number" do
        user = build(:user, phone_number: "")
        user.valid?
        expect(user).to be_valid
      end

      it "is valid without a introduction" do
        user = build(:user, introduction: "")
        user.valid?
        expect(user).to be_valid
      end

      it "is valid without a image" do
        user = build(:user, image: "")
        user.valid?
        expect(user).to be_valid
      end

    end

    context 'can not save' do
      it "is invalid without a nickname" do
        user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname][0]).to include("入力してください")
      end

      it "is invalid without a birthday" do
        user = build(:user, birthday: "")
        user.valid?
        expect(user.errors[:birthday][0]).to include("入力してください")
      end

      it "is invalid without a email" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email][0]).to include("入力してください")
      end

      it "is invalid because inappropriately format(After @ does not exist)" do
        user = build(:user, email: "123@")
        user.valid?
        expect(user.errors[:email][0]).to include("不正な値です")
      end

      it "is invalid because inappropriately format(Before @ does not exist)" do
        user = build(:user, email: "@123")
        user.valid?
        expect(user.errors[:email][0]).to include("不正な値です")
      end

      it "is invalid because inappropriately format(Without @)" do
        user = build(:user, email: "1234")
        user.valid?
        expect(user.errors[:email][0]).to include("不正な値です")
      end

      it "is invalid without a password" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password][0]).to include("入力してください")
      end

      it "is invalid because password_confirmation are different" do
        user = build(:user, password: "123456", password_confirmation: "654321")
        user.valid?
        expect(user.errors[:password_confirmation][0]).to include("入力が一致しません")
      end

      it "is invalid with password 5 letters or less" do
        user = build(:user, password: "12345", password_confirmation: "12345")
        user.valid?
        expect(user.errors[:password][0]).to include("6文字以上で入力してください")
      end

      it "is invalid with family_name with numbers " do
        user = build(:user, family_name_kana: "メル仮屋崎")
        user.valid?
        expect(user.errors[:family_name_kana][0]).to include("カナ文字を入力してください")
      end

      it "is invalid with family_name with numbers " do
        user = build(:user, first_name_kana: "メル太郎")
        user.valid?
        expect(user.errors[:first_name_kana][0]).to include("カナ文字を入力してください")
      end

      it "is invalid with family_name with numbers " do
        user = build(:user, family_name: "目流１２３")
        user.valid?
        expect(user.errors[:family_name][0]).to include("数字や特殊文字は使用できません")
      end

      it "is invalid with first_name with numbers " do
        user = build(:user, first_name: "太郎１２３")
        user.valid?
        expect(user.errors[:first_name][0]).to include("数字や特殊文字は使用できません")
      end
    end
  end
end
