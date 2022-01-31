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
      if @pets != []
        json_response(@pets)
      else
        render status: 404, json: {
        message: "There were no listing that matched your parameters."
        }
      end
    end

    def show
      @pet = Pet.find(params[:id])
      json_response(@pet)
    end

    def create
      @pet = Pet.create!(pet_params)
      if @pet.update!(pet_params)
        render status: 201, json: {
        message: "A listing for '#{@pet.name}' has been created successfully. ID = #{@pet.id}"
        }
      end
    end

    def update
      @pet = Pet.find(params[:id])
      if @pet.update!(pet_params)
        render status: 200, json: {
        message: "This listing for '#{@pet.name}' (id: #{@pet.id}) has been updated successfully."
        }
      end
    end

    def destroy
      @pet = Pet.find(params[:id])
      if @pet.destroy!
        render status: 200, json: {
        message: "This listing for '#{@pet.name}' (id: #{@pet.id}) has been deleted successfully."
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