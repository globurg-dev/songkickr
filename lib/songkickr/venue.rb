module Songkickr
  class Venue
    attr_accessor :display_name, :id, :lat, :lng,
      :street, :city, :country, :state, :zip,
      :website, :phone, :capacity, :description

    def initialize(venue_hash)
      @display_name = venue_hash["displayName"]
      @id           = venue_hash["id"]
      @lat          = venue_hash["lat"]
      @lng          = venue_hash["lng"]

      @street       = venue_hash["street"]
      @city         = venue_hash["city"]["displayName"]
      @country      = country_name(venue_hash)
      @state        = state_name(venue_hash)
      @zip          = venue_hash["zip"]

      @website      = venue_hash["website"]
      @phone        = venue_hash["phone"]
      @capacity     = venue_hash["capacity"]
      @description  = venue_hash["description"]
    end
    
    private
    
    def state_name(venue_hash)
      state = venue_hash["city"]["state"]
      !!state ? state["displayName"] : nil
    end
    
    def country_name(venue_hash)
      country = venue_hash["city"]["country"]
      !!country ? country["displayName"] : nil
    end
  end
end
