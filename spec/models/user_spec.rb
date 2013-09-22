require 'spec_helper'

describe User do
  before(:all) do
    Place.destroy_all
    User.destroy_all
    @user = User.make!
    @place = Place.make!
  end

  it 'converts email to a string' do
    expect(@user.to_s).to eq @user.email
  end

  describe 'Admin' do
    before(:all) do
      @user.update_attributes({
        role: User::ROLE_ADMIN,
        place: nil
      })
    end

    it 'checks privileges' do
      expect(@user.access_level).to eq 4
      expect(@user.admin?).to be true
      expect(@user.owner?).to be false
      expect(@user.member?).to be false
    end

    it 'doesnt let to save admin with a place' do
      expect(@user.update_attributes(place: @place)).to be false
    end
  end

  describe 'Owner' do
    before(:all) do
      @user.update_attributes({
        role: User::ROLE_OWNER,
        place: @place
      })
    end

    it 'checks privileges' do
      expect(@user.access_level).to eq 3
      expect(@user.admin?).to be false
      expect(@user.owner?).to be true
      expect(@user.member?).to be false
    end

    it 'doesnt let to save owner without a place' do
      expect(@user.update_attributes(place: nil)).to be false
    end
  end

  describe 'Member' do
    before(:all) do
      @user.update_attributes({
        role: User::ROLE_MEMBER,
        place: @place
      })
    end

    it 'checks privileges' do
      expect(@user.access_level).to eq 2
      expect(@user.admin?).to be false
      expect(@user.owner?).to be false
      expect(@user.member?).to be true
    end

    it 'doesnt let to save member without a place' do
      expect(@user.update_attributes(place: nil)).to be false
    end
  end

  describe 'Visitor' do
    before(:all) do
      @user.update_attributes({
        role: User::ROLE_VISITOR,
        place: nil
      })
    end

    it 'checks privileges' do
      expect(@user.access_level).to eq 1
      expect(@user.admin?).to be false
      expect(@user.owner?).to be false
      expect(@user.member?).to be false
    end

    it 'doesnt let to save visitor with a place' do
      expect(@user.update_attributes(place: @place)).to be false
    end
  end
end
