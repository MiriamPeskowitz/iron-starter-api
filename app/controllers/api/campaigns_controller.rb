class API::CampaignsController < ApplicationController


    # GET /api/campaigns 
    def index 
        @campaigns = Campaign.all 
        json_response(@campaigns) 
    end
end
