require "sinatra"
require "sinatra/reloader"


get("/") do
  erb(:homepage)
end

get("/enter-dates") do
  erb(:dates)
end


get("/asteroids/results") do
  require "http"
  @start= params.fetch("start_date")
  @end= params.fetch("end_date")
  @url= "https://api.nasa.gov/neo/rest/v1/feed?start_date=#{@start}&end_date=#{@end}&api_key=#{ENV.fetch("NASA_API_KEY")}"
  #@raw_response=HTTP.get(@url)

  #@string_response= @raw_response.to_s

  #@parsed_response= JSON.parse(@string_response)
  
  #@list_of_objects= @parsed_response.fetch("near_earth_objects")
  
  begin
    @raw_response = HTTP.get(@url)
    @string_response = @raw_response.to_s
    @parsed_response = JSON.parse(@string_response)

    # Check if the response contains the expected data
    if @parsed_response.key?("near_earth_objects")
      @list_of_objects = @parsed_response.fetch("near_earth_objects")
    else
      @list_of_objects = {}
      logger.error "Key 'near_earth_objects' not found in response"
      halt 500, "Error: 'near_earth_objects' key missing in API response."
    end

  rescue JSON::ParserError => e
    logger.error "JSON parsing error: #{e.message}"
    halt 500, "Internal Server Error: Unable to parse API response."
  rescue => e
    logger.error "Unexpected error: #{e.message}"
    halt 500, "Internal Server Error: #{e.message}"
  end
  






  erb(:asteroids_results)
end
