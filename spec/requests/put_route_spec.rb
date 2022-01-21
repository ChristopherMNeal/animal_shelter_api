require 'rails_helper'

describe "update a pet route", :type => :request do
  let!(:pets) { FactoryBot.create_list(:pet, 20)}

  before do
    put "/pets/#{Pet.first.id}", params: { :breed => 'Tabby', :name => 'Lil Bub', :species => 'Cat' }
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(200)
  end

  it 'returns an updated status message' do
    expect(JSON.parse(response.body)['message']).to eq("This listing has been updated successfully.")
  end

  it 'should have new breed and content' do
    expect(Pet.first.breed).to eq("Tabby")
    expect(Pet.first.name).to eq("Lil Bub")
    expect(Pet.first.species).to eq("Cat")
  end
end
