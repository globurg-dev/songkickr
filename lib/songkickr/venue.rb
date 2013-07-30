module Songkickr
  class Venue
    attr_accessor :display_name, :id, :lat, :lng,
      :street, :city, :country, :state, :zip,
      :website, :phone, :capacity, :description

    def initialize(venue_hash)
      @venue_hash = venue_hash
      
      @display_name = @venue_hash["displayName"]
      @id           = @venue_hash["id"]
      @lat          = @venue_hash["lat"]
      @lng          = @venue_hash["lng"]

      @street       = @venue_hash["street"]
      @city         = city_name
      @country      = country_name
      @state        = state_name
      @zip          = @venue_hash["zip"]

      @website      = @venue_hash["website"]
      @phone        = @venue_hash["phone"]
      @capacity     = @venue_hash["capacity"]
      @description  = @venue_hash["description"]
    end
    
    private
    
    def state_name
      return unless has_city?

      state = raw_city["state"]
      !!state ? state["displayName"] : nil
    end
    
    def country_name
      return unless has_city?

      country = raw_city["country"]
      !!country ? country["displayName"] : nil
    end
    
    def city_name
      return unless has_city?

      raw_city["displayName"]
    end

    def has_city?
      !!raw_city
    end

    def raw_city
      @venue_hash["city"]
    end
  end
end
