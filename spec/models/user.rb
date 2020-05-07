require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a nickname, family_name, first_name, family_name_pseudonym, first_name_pseudonym, birth_year, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is valid with a nickname, uid, provider, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is ininvalid without a nickname" do
      user = build(:user, nickname: nil)
      user.invalid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is ininvalid without a family_name" do
      user = build(:user, family_name: nil)
      user.invalid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    it "is ininvalid without a first_name" do
      user = build(:user, first_name: nil)
      user.invalid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is ininvalid without a family_name_pseudonym" do
      user = build(:user, family_name_pseudonym: nil)
      user.invalid?
      expect(user.errors[:family_name_pseudonym]).to include("can't be blank")
    end

    it "is ininvalid without a first_name_pseudonym" do
      user = build(:user, first_name_pseudonym: nil)
      user.invalid?
      expect(user.errors[:first_name_pseudonym]).to include("can't be blank")
    end

    it "is ininvalid without a birth_year" do
      user = build(:user, birth_year: nil)
      user.invalid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end

    it "is ininvalid without a email" do
      user = build(:user, email: nil)
      user.invalid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is ininvalid without a password" do
      user = build(:user, password: nil)
      user.invalid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is ininvalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.invalid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is ininvalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.invalid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is ininvalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.invalid?
      expect(user.errors[:password][0]).to include("is too short")
    end
  end
end

