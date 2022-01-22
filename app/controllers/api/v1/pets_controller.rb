module Api::V1  
  class PetsController < ApplicationController
    def random
      @pets = Pet.all.shuffle.sample
      json_response(@pets)
    end

    def index
      name = params[:name]
      species = params[:species]
      if name
        @pets = Pet.search_name(name).paginate(page: params[:page], per_page: 10)
      elsif species
        @pets = Pet.species_filter(species).paginate(page: params[:page], per_page: 10)
      elsif !params[:page]
        @pets = Pet.all
      else
        @pets = Pet.paginate(page: params[:page], per_page: 10)
      end
      json_response(@pets)
    end

    def show
      @pet = Pet.find(params[:id])
      json_response(@pet)
    end

    def create
      @pet = Pet.create!(pet_params)
      json_response(@pet)
    end

    def update
      @pet = Pet.find(params[:id])
      if @pet.update!(pet_params)
        render status: 200, json: {
        message: "This listing has been updated successfully."
        }
      end
    end

    def destroy
      @pet = Pet.find(params[:id])
      if @pet.destroy!
        render status: 200, json: {
        message: "This listing has been deleted successfully."
        }
      end
    end

    private
    def json_response(object, status = :ok)
      render json: object, status: status
    end

    def pet_params
      params.permit(:name, :species, :breed)
    end
  end
end