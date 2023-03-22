class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def show
        users = User.find_by(id: params[:id])
        render json: users, include: :items
    end

    private 

    def render_not_found_response
        render json: { error: "Dog house not found" }, status: :not_found
    end
end
