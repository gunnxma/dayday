require 'rails_helper'

RSpec.describe List, type: :model do
	let(:list) { FactoryGirl.build(:list) }
	let(:thing) { FactoryGirl.build(:thing_with_photos) }

  it "should be found by has_thing" do  		
      list.things << thing
      expect(list.has_thing?(thing)).to eq(true)
  end	
end
