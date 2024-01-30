class ForecastService

  include HTTParty

  def self.get_forecast(zip_code, lat, lng)
    response = get("https://api.open-meteo.com/v1/forecast?latitude=#{lat}&longitude=#{lng}&current=temperature_2m&temperature_unit=fahrenheit&daily=temperature_2m_max")
    if response.code == 200
      forecast_data = JSON.parse(response.body)
      puts response.body
      unless forecast_data.nil?
        return {
          updated_at: DateTime.now,
          zip_code: zip_code,
          current_temperature: forecast_data['current']['temperature_2m'],
          forecast_temperature: forecast_data['daily']['temperature_2m_max']
        }
      end
    end
  end

end