class SeriesController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        @series = Series.where.not(id: 0)
        @page_series = @series.paginate(page:params[:page],per_page:10)
        #render json: SeriesSerializer.new(series, options).serialized_json
    end

    def show
        @series = Series.friendly.find(params[:slug])

        #render json: SeriesSerializer.new(singleSeries, options).serialized_json
    end

    def new
        @series = Series.new
    end

    def create
        singleSeries = Series.new(series_params)
        #singleSeries.seriesPic.attach(params[:seriesPic])

        if(singleSeries.save)
            redirect_to singleSeries, notice: "Series successfully created!"   
        else
            render new
        end
    end

    def update
        #TODO: Add delete current photo checkbox
        singleSeries = Series.friendly.find(params[:slug])

        if singleSeries.update(series_params)
            redirect_to singleSeries, notice: "Series successfully updated!"          
        else
            redirect_to series, alert: "Series could not be updated!"
        end
    end

    def destroy
        singleSeries = Series.friendly.find(params[:slug])
        singleSeries.sermons.each { |sermon| sermon.update_attributes(series_id: 0) }

        if singleSeries.destroy
            respond_to do |format|
                format.html { redirect_to series_index_url, notice: 'Sermon successfully deleted.' }
            end              
        else
            redirect_to singleSeries, alert: "Series could not be deleted!"
        end
    end

    def delete_image_attachment
        @seriesPic = ActiveStorage::Attachment.find(params[:id])
        @seriesPic.purge
        redirect_back(fallback_location: series_index_url)
    end

    private

    def series_params
        params.require(:series).permit(:title, :slug, :seriesPic)
    end
end