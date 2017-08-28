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


end
