class SeriesController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        @series = Series.where.not(id: 0)
        #render json: SeriesSerializer.new(series, options).serialized_json
    end

    def show
        @series = Series.find(params[:slug])

        #render json: SeriesSerializer.new(singleSeries, options).serialized_json
    end

    def new
        @series = Series.new
    end

    def create
        singleSeries = Series.new(series_params)
        #singleSeries.seriesPic.attach(params[:seriesPic])

        if(singleSeries.save)
            redirect_to singleSeries
        else
            render new
        end
    end

    def update
        singleSeries = Series.find_by(slug: params[:slug])

        if singleSeries.update(series_params)
            redirect_to singleSeries              
        else
            render json: { error: singleSeries.errors.messages }, status: 422
        end
    end

    def destroy
        singleSeries = Series.find_by(slug: params[:slug])

        if singleSeries.destroy
            redirect_to index               
        else
            render json: { error: singleSeries.errors.messages }, status: 422
        end
    end

    private

    def series_params
        params.require(:series).permit(:title, :seriesPic)
    end
end