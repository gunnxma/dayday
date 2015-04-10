require 'rails_helper'

RSpec.describe OwnsController, type: :controller do
	let(:user) { FactoryGirl.create(:user) }
	let(:user2) { FactoryGirl.create(:user) }
	let(:thing) { FactoryGirl.create(:thing_with_photos, user_id: user.id) }

	before(:each) do
		allow(controller).to receive(:current_user).and_return(user)
	end

	it 'POST /owns' do
		post :create, :id => thing.id
		expect(response.body).to eq("1")
		expect(thing.owns.count).to eq(1)

		post :create, :id => thing.id
		expect(response.body).to eq("1")
		expect(thing.owns.count).to eq(1)

		allow(controller).to receive(:current_user).and_return(user2)

		post :create, :id => thing.id
		expect(response.body).to eq("2")
		expect(thing.owns.count).to eq(2)

		allow(controller).to receive(:current_user).and_return(user)

		delete :destroy, :id => thing.id
		expect(response.body).to eq("1")
		expect(thing.owns.count).to eq(1)

		allow(controller).to receive(:current_user).and_return(user2)
		delete :destroy, :id => thing.id
		expect(response.body).to eq("0")
		expect(thing.owns.count).to eq(0)
	end

	it 'require login' do
		allow(controller).to receive(:current_user).and_return(nil)

		post :create
		expect(response.status).to eq(403)

		delete :destroy, :id => 1
		expect(response.status).to eq(403)
	end
end
