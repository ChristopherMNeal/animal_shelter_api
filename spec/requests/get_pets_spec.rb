require 'rails_helper'

describe "get all pet listings route", :type => :request do
  let!(:pets) { FactoryBot.create_list(:pet, 14)}
  
  # This before block could certainly be improved, but I'm stumped.
  before do
    if Pet.where(name: "Hel Goddess Of Death")
      hel = Pet.where(name: "Hel Goddess Of Death")
      hel.destroy(hel.ids)
    end
    if Pet.where(name: "Skuld Queen Of The Elves")
      hel = Pet.where(name: "Skuld Queen Of The Elves")
      hel.destroy(hel.ids)
    end
  end
  
  it 'returns all 14 pets' do
    get '/api/v1/pets'
    expect(JSON.parse(response.body).size).to eq(14)
  end

  it 'returns the first 10 pets' do
    get '/api/v1/pets?page=1'
    expect(JSON.parse(response.body).size).to eq(10)
  end

  it 'returns the last 4 pets' do
    get '/api/v1/pets?page=2'
    expect(JSON.parse(response.body).size).to eq(4)
  end
  
  it 'returns status code 200' do
    get '/api/v1/pets'
    expect(response).to have_http_status(:success)
  end
end