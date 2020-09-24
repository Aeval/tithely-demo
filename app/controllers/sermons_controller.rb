class SermonsController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        @sermons = Sermon.all
        #render json: SermonSerializer.new(sermons).serialized_json
    end

    def show
        @sermon = Sermon.find(params[:id])
        @series = Series.all
        #render json: SermonSerializer.new(sermon, options).serialized_json
    end

    def new
        @sermon = Sermon.new
        @series = Series.all
    end

    def create
        @sermon = Sermon.new(sermon_params)
        
        if(@sermon.save)
            redirect_to @sermon, notice: "Sermon successfully created!"
        else
            render new
        end
    end

    def update
        @sermon = Sermon.find(params[:id])

        if @sermon.update(sermon_params)
            redirect_to @sermon, notice: "Sermon successfully updated!"
        else
            render json: { error: @sermon.errors.messages }, status: 422
        end
    end

    def destroy
        sermon = Sermon.find(params[:id])

        if sermon.destroy
            respond_to do |format|
                format.html { redirect_to sermons_url, notice: 'Sermon successfully deleted.' }
            end
        else
            render json: { error: sermon.errors.messages }, status: 422
        end
    end

    private

    def sermon_params
        params.require(:sermon).permit(:title, :description, :series_id, :sermonPic)
    end
end