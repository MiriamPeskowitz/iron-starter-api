require 'rails_helper'

RSpec.describe 'Campaigns API', type: :request do

    let!(:campaigns) { create_list(:campaign, 10) }
    let(:campaign_id) { campaigns.first.id }

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
end
