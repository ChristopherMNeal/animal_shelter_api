require 'rails_helper'

describe "filter by species route", :type => :request do
  let!(:pets) { FactoryBot.create_list(:pet, 10)}
  FactoryBot.create(:pet, :name => "Skuld Queen Of The Elves", :species => 'Bunny')
  before { get "/pets?species=Bunny"}

  it 'returns one pet' do
    expect(JSON.parse(response.body).size).to eq(1)
  end
  
  it 'returns the pet with name: "Skuld Queen Of The Elves"' do
    expect(JSON.parse(response.body).first['name']).to eq('Skuld Queen Of The Elves')
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end