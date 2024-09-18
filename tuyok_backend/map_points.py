from geopy.geocoders import Nominatim

def davao_coords():
    geolocator = Nominatim(user_agent="FareCalculator (vaughnrochederoda@gmail.com)")
    location = geolocator.geocode("Davao City")
    return [location.latitude,]

def map_points():
    geolocator = Nominatim(user_agent="FareCalculator (vaughnrochederoda@gmail.com)")

    location_a = geolocator.geocode(location1)
    location_a = geolocator.geocode(location2)

    if location_a and location_b:
        return [
            [location_a.latitude, location_a.longitude],
            [location_b.latitude, location_b.longitude]
        ]
    else:
        return None