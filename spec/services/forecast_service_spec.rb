# spec/services/forecast_service_spec.rb

require 'rails_helper'

RSpec.describe ForecastService do
  describe '.get_forecast' do
    context 'with valid parameters' do
      let(:zip_code) { '12345' }
      let(:lat) { 37.7749 }
      let(:lng) { -122.4194 }

      it 'returns forecast data' do
        forecast = ForecastService.get_forecast(zip_code, lat, lng)
        expect(forecast).to be_a(Hash)
        expect(forecast.keys).to contain_exactly(:updated_at, :zip_code, :current_temperature, :forecast_temperature)
      end
    end

    context 'with invalid parameters' do
      let(:zip_code) { 'invalid_zip' }
      let(:lat) { 'invalid_lat' }
      let(:lng) { 'invalid_lng' }

      it 'returns nil' do
        forecast = ForecastService.get_forecast(zip_code, lat, lng)
        expect(forecast).to be_nil
      end
    end
  end
end
