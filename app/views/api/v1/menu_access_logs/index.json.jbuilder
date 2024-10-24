json.array! @menu_access_logs do |log|
  json.id log.id
  json.day_of_week log.day_of_week
  json.time_frame log.time_frame
  json.visitors log.visitors
end
