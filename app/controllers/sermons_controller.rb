class SermonsController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        @sermons = Sermon.all
        @page_sermons = @sermons.paginate(page:params[:page],per_page:10)
        #render json: SermonSerializer.new(sermons).serialized_json
    end

    def show
        @sermon = Sermon.find(params[:id])
        @series = Series.all
        @sgl_series = Series.find(@sermon.series_id)
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
        #TODO: Add delete current photo checkbox
        @sermon = Sermon.find(params[:id])

        if @sermon.update(sermon_params)
            redirect_to @sermon, notice: "Sermon successfully updated!"
        else
            redirect_to @sermon, alert: "Sermon could not be updated!"
        end
    end

    def destroy
        sermon = Sermon.find(params[:id])

        if (sermon.destroy)
            respond_to do |format|
                format.html { redirect_to sermons_url, notice: 'Sermon successfully deleted.' }
            end
        else
            redirect_to sermon, alert: "Sermon could not be deleted!"
        end
    end

    def delete_image_attachment
        @sermonPic = ActiveStorage::Attachment.find(params[:id])
        @sermonPic.purge
        redirect_back(fallback_location: sermons_url)
    end

    private

    def sermon_params
        params.require(:sermon).permit(:title, :description, :series_id, :sermonPic)
    end
end