require 'rails_helper'

RSpec.describe Article, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:favorites) }

    it { should belong_to(:uploader) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
