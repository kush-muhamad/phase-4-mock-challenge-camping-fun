class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

   #get /campers
    def index
        campers = Camper.all
        render json: campers
    end
   #get /campers/:id
    def show
        camper = find_camper
        render json: camper, serializer:CamperActivitySerializer 
    end
    #post /campers
    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private
    def find_camper
        Camper.find( params[:id])
    end

    def camper_params
        params.permit(:name, :age)
    end

    def not_found
      render json: { error: "Camper not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(errors)
        render json: { errors: errors }, status: 422
    end
end
