require "rails_helper"

RSpec.describe Tag, type: :model do
  describe "Direct Associations" do
    it { should have_many(:articles) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
