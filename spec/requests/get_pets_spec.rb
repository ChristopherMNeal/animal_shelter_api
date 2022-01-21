require 'rails_helper'

describe "get all pet listings route", :type => :request do
  let!(:pets) { FactoryBot.create_list(:pet, 14)}

  it 'returns all 14 pets' do
    get '/pets'
    expect(JSON.parse(response.body).size).to eq(14)
  end

  it 'returns the first 10 pets' do
    get '/pets?page=1'
    expect(JSON.parse(response.body).size).to eq(10)
  end

  it 'returns the last 4 pets' do
    get '/pets?page=2'
    expect(JSON.parse(response.body).size).to eq(4)
  end
  
  it 'returns status code 200' do
    get '/pets'
    expect(response).to have_http_status(:success)
  end
end