class ForecastsController < ApplicationController
  def show
    unless params[:zip_code].blank? || params[:lat].blank? || params[:lng].blank?
      @forecast = Rails.cache.fetch("weather-forecast-#params[:zip_code]", expires_in: 30.minutes) do
        @forecast = ForecastService.get_forecast(params[:zip_code], params[:lat], params[:lng])
      end
    else
      redirect_to('/')
      return
    end
  end
end
