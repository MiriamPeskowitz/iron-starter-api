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

    # PUT /api/campaigns/:id
    def update 
        @campaign.update(campaign_params) 
        json_response(@campaign) 
    end

    # DELETE /api/campaigns/:id
    def destroy 
        @campaign.destroy
        head :no_content 
    end

    private 

        def campaign_params
            params.require(:campaign).permit(:title, :description, :goal, :pledged) 
        end

        def set_campaign  
            @campaign = Campaign.find(params[:id]) 
        end
end
