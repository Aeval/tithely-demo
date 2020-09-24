class SeriesController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        #Pass variables to page view, ordered and paginated
        @series = Series.where.not(id: 0).order('created_at DESC')
        @page_series = @series.paginate(page:params[:page],per_page:10)

        #To access data as API
        #render json: SeriesSerializer.new(series, options).serialized_json
    end

    def show
        #Pass variables to page view, paginate interal sermons
        @series = Series.friendly.find(params[:slug])
        @page_sermons = @series.sermons.paginate(page:params[:page],per_page:3)

        #To access data as API
        #render json: SeriesSerializer.new(singleSeries, options).serialized_json
    end

    def new
        #Pass variables to page view
        @series = Series.new
    end

    def create
        #Create new series with passed params
        singleSeries = Series.new(series_params)

        if(singleSeries.save)
            #redirect to new series
            redirect_to singleSeries, notice: "Series successfully created!"   
        else
            #render the form again with alert
            render new, alert: "Series could not be created!"  
        end
    end

    def update
        #Find series to update
        singleSeries = Series.friendly.find(params[:slug])

        if singleSeries.update(series_params)
            #redirect to series
            redirect_to singleSeries, notice: "Series successfully updated!"          
        else
            redirect_to series, alert: "Series could not be updated!"
        end
    end

    def destroy
        #Find sermon to destroy
        singleSeries = Series.friendly.find(params[:slug])
        singleSeries.sermons.each { |sermon| sermon.update_attributes(series_id: 0) }

        if singleSeries.destroy
            #redirect to series index
            respond_to do |format|
                format.html { redirect_to series_index_url, notice: 'Sermon successfully deleted.' }
            end              
        else
            #Redirect to series
            redirect_to singleSeries, alert: "Series could not be deleted!"
        end
    end

    def delete_image_attachment
        #Find series' attached picture and delete it, then redirect to last page
        @seriesPic = ActiveStorage::Attachment.find(params[:id])
        @seriesPic.purge
        redirect_back(fallback_location: series_index_url)
    end

    private

    def series_params
        params.require(:series).permit(:title, :slug, :seriesPic)
    end
end