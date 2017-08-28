require 'rails_helper'

RSpec.describe 'Comments API', type: :request do
    # Initial Test Data
    let!(:campaign) { create(:campaign) }
    let!(:comments) { create_list(:comment, 10, campaign_id: campaign.id) }
    let(:campaign_id) { campaign.id }
    let(:comment_id) { comments.first.id }

    # Tests for GET /api/campaigns/:campaign_id/comments 
    describe 'GET /api/campaigns/:campaign_id/comments' do  
        before { get "/api/campaigns/#{campaign_id}/comments" } 

        context 'when campaign exists' do   
            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

            it 'returns all campaign comments' do  
                expect(json.size).to eq(10) 
            end 
        end 

        context 'when campaign does not exist' do  
            let(:campaign_id) { 0 }

            it 'returns status code 404' do  
                expect(response).to have_http_status(404) 
            end 

            it 'returns record not found message' do  
                expect(response.body).to match(/Couldn't find Campaign/)
            end
        end
    end

    # Tests for GET /api/campaigns/:campaign_id/comments/:id
    describe 'GET /api/campaigns/:campaign_id/comments/:id' do  
        before { get "/api/campaigns/#{campaign_id}/comments/#{comment_id}" }

        context 'when campaign comment exists' do  
            it 'returns status code 200' do  
                expect(response).to have_http_status(200)
            end

            it 'returns the campaign comment' do  
                expect(json[:id]).to eq(comment_id) 
            end
        end

        context 'when campaign comment does not exist' do  
            let(:comment_id) { 0 } 

            it 'returns status code 404' do   
                expect(response).to have_http_status(404)
            end

            it 'returns record not found message' do  
                expect(response.body).to match(/Couldn't find Comment/)
            end
        end
    end
end
