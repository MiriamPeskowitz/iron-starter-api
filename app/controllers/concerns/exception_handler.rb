module ExceptionHandler 
    extend ActiveSupport::Concern 

    included do  
        rescue_from ActiveRecord::RecordNotFound do |entity| 
            json_response({ message: entity.message }, :not_found)
        end 

        rescue_from ActiveRecord::RecordInvalid, ActionController::ParameterMissing do |entity| 
            json_response({ message: entity.message }, :unprocessable_entity)
        end
    end 
end

