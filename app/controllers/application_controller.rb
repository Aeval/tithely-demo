class ApplicationController < ActionController::Base
    rescue_from ActionController::ParameterMissing do |exception|
        @missingParam = exception.to_s.split(':')[1]
        redirect_back(fallback_location: sermons_url, alert: "#{@missingParam.titleize} is required! Please try again with a #{@missingParam}!")
    end
end
