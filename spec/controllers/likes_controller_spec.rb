require 'rails_helper'

RSpec.describe LikesController, type: :controller do
	let(:user) { FactoryGirl.create(:user) }
	let(:user2) { FactoryGirl.create(:user) }
	let(:thing) { FactoryGirl.create(:thing_with_photos, user_id: user.id) }

	before(:each) do
		allow(controller).to receive(:current_user).and_return(user)
	end

	it 'POST /likes' do
		post :create, :type => 'Thing', :id => thing.id
		expect(response.body).to eq("1")
		expect(thing.likes.count).to eq(1)

		post :create, :type => 'Thing', :id => thing.id
		expect(response.body).to eq("1")
		expect(thing.likes.count).to eq(1)

		allow(controller).to receive(:current_user).and_return(user2)

		post :create, :type => 'Thing', :id => thing.id
		expect(response.body).to eq("2")
		expect(thing.likes.count).to eq(2)

		allow(controller).to receive(:current_user).and_return(user)

		delete :destroy, :type => 'Thing', :id => thing.id
		expect(response.body).to eq("1")
		expect(thing.likes.count).to eq(1)

		allow(controller).to receive(:current_user).and_return(user2)
		delete :destroy, :type => 'Thing', :id => thing.id
		expect(response.body).to eq("0")
		expect(thing.likes.count).to eq(0)
	end
end
