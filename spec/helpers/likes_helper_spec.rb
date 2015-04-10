require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the LikesHelper. For example:
#
# describe LikesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe LikesHelper, type: :helper do
  describe "likeable_tag" do
  	let(:user) { FactoryGirl.create(:user) }
  	let(:thing) { FactoryGirl.create(:thing_with_photos) }

  	it "nil param" do
  		expect(helper.likeable_tag(nil)).to eq("")
  	end
  end
end
