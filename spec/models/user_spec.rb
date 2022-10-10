require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid user with email,name and password" do
    user = 
    expect(FactoryBot.build(:user)).to be_valid
    puts "#{user}"
  end


end
