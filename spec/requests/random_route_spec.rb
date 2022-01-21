require 'rails_helper'

describe "get a random pet route", :type => :request do
  let!(:pets) { FactoryBot.create_list(:pet, 20)}

  before { get '/pets/random'}

  it 'returns 6 columns (id, name, species, created_at, updated_at, and breed) from a random pet' do
    expect(JSON.parse(response.body).size).to eq(6)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end