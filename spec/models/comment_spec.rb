require 'rails_helper'

RSpec.describe Comment, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:commenter) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
