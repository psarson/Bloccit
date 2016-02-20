require 'rails_helper'
include RandomData

RSpec.describe Topic, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }

  it { is_expected.to have_many(:posts) }

   it { is_expected.to validate_presence_of(:name) }
   it { is_expected.to validate_presence_of(:description) }
   it { is_expected.to validate_length_of(:name).is_at_least(5) }
   it { is_expected.to validate_length_of(:description).is_at_least(15) }

  describe "attributes" do
    it "responds to name" do
      expect(topic).to respond_to(:name)
    end

    it "responds to description" do
      expect(topic).to respond_to(:description)
    end

    it "responds to public" do
      expect(topic).to respond_to(:public)
    end


    it "is public by default" do
      expect(topic.public).to be(true)
    end
  end
end