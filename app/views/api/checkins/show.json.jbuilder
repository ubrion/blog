json.id @checkin.id
json.datetime @checkin.datetime.in_time_zone(@checkin.time_zone)
json.notes @checkin.notes
json.latitude @checkin.latitude
json.longitude @checkin.longitude

json.place do
  json.id @checkin.place_id
  json.name @checkin.place.name
  json.latitude @checkin.place.latitude
  json.longitude @checkin.place.longitude
end
