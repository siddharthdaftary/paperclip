require 'rails_helper'

RSpec.describe Article, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:tag) }

    it { should have_many(:comments) }

    it { should have_many(:favorites) }

    it { should belong_to(:uploader) }

    end

    describe "InDirect Associations" do

    it { should have_many(:readers) }

    end

    describe "Validations" do

    end
end
