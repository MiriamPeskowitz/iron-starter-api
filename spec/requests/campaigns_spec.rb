require 'rails_helper'

RSpec.describe 'Campaigns API', type: :request do
    # Initialize Test Data
    let!(:campaigns) { create_list(:campaign, 10) }
    let(:campaign_id) { campaigns.first.id }

    # Tests for GET /api/campaigns
    describe 'GET /api/campaigns' do  

        before { get '/api/campaigns' }

        it 'returns campaigns' do  
            expect(json).not_to be_empty 
            expect(json.size).to eq(10)
        end 

        it 'returns status code 200' do 
            expect(response).to have_http_status(200)
        end 
    end

    # Tests for GET /api/campaigns/:id 
    describe 'GET /api/campaigns/:id' do  
        before { get "/api/campaigns/#{campaign_id}" }

        context 'when campaign exists' do 
            it 'returns the campaign' do  
                expect(json).not_to be_empty 
                expect(json[:id]).to eq(campaign_id) 
            end

            it 'returns status code 200' do  
                expect(response).to have_http_status(200) 
            end
        end
    end

    # Tests for POST '/api/campaigns'
    describe 'POST /api/campaigns' do  

        let(:valid_attributes) { 
            {  
                campaign: {
                    title: Faker::Lorem.word, 
                    description: Faker::Lorem.paragraph,
                    goal: Faker::Number.between(1000, 1000000), 
                    pledged: Faker::Number.between(0, 10),
                    deadline: Faker::Time.between(DateTime.now + 15, DateTime.now + 30)
                }
            } 
        }

        context 'when the request is valid' do 
            
            before { post '/api/campaigns', params: valid_attributes }

            it 'creates a campaign' do  
                expect(json[:title]).to eq(valid_attributes[:campaign][:title]) 
                expect(json[:description]).to eq(valid_attributes[:campaign][:description])
                expect(json[:goal]).to eq(valid_attributes[:campaign][:goal])
                expect(json[:pledged]).to eq(valid_attributes[:campaign][:pledged])
                expect(json[:deadline]).not_to eq(nil)
                expect(json[:id]).not_to eq(nil)
            end

            it 'returns status code 201' do   
                expect(response).to have_http_status(201) 
            end
        end
    end


end
