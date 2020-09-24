class SermonsController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        #Pass variables to page view, ordered and paginated
        @sermons = Sermon.all.order('created_at DESC')
        @page_sermons = @sermons.paginate(page:params[:page],per_page:10)

        #To access data as API
        #render json: SermonSerializer.new(sermons).serialized_json
    end

    def show
        #Pass variables to page view
        @sermon = Sermon.find(params[:id])
        @series = Series.all
        @sgl_series = Series.find(@sermon.series_id)

        #To access data as API
        #render json: SermonSerializer.new(sermon, options).serialized_json
    end

    def new
        #Pass variables to page view
        @sermon = Sermon.new
        @series = Series.all
    end

    def create
        #Create new sermon with passed params
        @sermon = Sermon.new(sermon_params)
        
        if(@sermon.save)
            #redirect to sermon
            redirect_to @sermon, notice: "Sermon successfully created!"
        else
            #render the form again with alert
            render new, alert: "Sermon could not be created!"  
        end
    end

    def update
        #Find sermon to update
        @sermon = Sermon.find(params[:id])

        if @sermon.update(sermon_params)
            #redirect to sermon
            redirect_to @sermon, notice: "Sermon successfully updated!"
        else
            redirect_to @sermon, alert: "Sermon could not be updated!"
        end
    end

    def destroy
        #Find sermon to destroy
        sermon = Sermon.find(params[:id])

        if (sermon.destroy)
            #redirect to sermon index
            respond_to do |format|
                format.html { redirect_to sermons_url, notice: 'Sermon successfully deleted.' }
            end
        else
            #Redirect to last page
            redirect_back(fallback_location: sermons_url, alert: "Sermon could not be deleted!")
        end
    end

    def delete_image_attachment
        #Find sermon's attached picture and delete it, then redirect to last page
        @sermonPic = ActiveStorage::Attachment.find(params[:id])
        @sermonPic.purge
        redirect_back(fallback_location: sermons_url)
    end

    private

    def sermon_params
        params.require(:sermon).permit(:title, :description, :series_id, :sermonPic)
    end
end