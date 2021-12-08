require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:recieved_follow_requests) }

    it { should have_many(:sent_follow_requests) }

    it { should have_many(:articles) }

    it { should have_many(:comments) }

    it { should have_many(:favorites) }

    end

    describe "InDirect Associations" do

    it { should have_many(:liked_articles) }

    it { should have_many(:reading_activity) }

    end

    describe "Validations" do

    end
end
