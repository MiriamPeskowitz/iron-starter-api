class API::CampaignsController < ApplicationController
    before_action :set_campaign, only: [:show, :update, :destroy] 

    # GET /api/campaigns 
    def index 
        @campaigns = Campaign.all 
        json_response(@campaigns) 
    end

    def show 
        json_response(@campaign)
    end

    private 
        def set_campaign  
            @campaign = Campaign.find(params[:id]) 
        end
end
