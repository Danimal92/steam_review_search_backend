require 'rest-client'
require 'uri'
require 'json'

class GamesController < ApplicationController

    def gather_reviews
        my_params = params[:id]
        uri = "https://store.steampowered.com/appreviews/#{my_params}?json=1&filter=recent&day_range=1000&num_per_page=100"
        # encoded_url = URI.encode(uri)
        
        # final_uri = URI.parse(encoded_url)
        
        # byebug
        result = []

        response = RestClient.get("#{uri}&cursor=*")
        my_object = JSON.parse(response, object_class: OpenStruct)
        result.push(my_object)
        next_cursor = '*'

        while next_cursor != my_object.cursor do
            next_cursor = my_object.cursor
            response = RestClient.get("#{uri}&cursor=#{next_cursor}")
            my_object = JSON.parse(response, object_class: OpenStruct)
            result.push(my_object)
        end
        # byebug
        render :json => result

    end



end
