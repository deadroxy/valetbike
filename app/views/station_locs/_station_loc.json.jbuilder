json.extract! station_loc, :id, :name, :address, :longitude, :latitude, :created_at, :updated_at
json.title location.name
json.tooltip html_link_to(location)
