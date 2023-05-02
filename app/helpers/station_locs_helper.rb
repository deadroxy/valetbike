module StationLocsHelper

    def html_link_to(location)
        link_to location.address, locations_path(location)
    end
end
