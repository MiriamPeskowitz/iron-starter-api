class API::CampaignsController < ApplicationController
    before_action :set_campaign, only: [:show, :update, :destroy] 

    # GET /api/campaigns 
    def index 
        @campaigns = Campaign.all 
        json_response(@campaigns) 
    end

    # GET /api/campaigns/:id
    def show 
        json_response(@campaign)
    end

    # POST /api/campaigns
    def create 
        @campaign = Campaign.create!(campaign_params) 
        json_response(@campaign, 201)
    end

    def update 
        @campaign.update(campaign_params) 
        json_response(@campaign) 
    end

    private 

        def campaign_params
            params.require(:campaign).permit(:title, :description, :goal, :pledged, :deadline) 
        end

        def set_campaign  
            @campaign = Campaign.find(params[:id]) 
        end
end
