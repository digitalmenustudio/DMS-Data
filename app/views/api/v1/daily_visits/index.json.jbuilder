json.array! @daily_visits do |visit|
  json.id visit.id
  json.date visit.date
  json.weekday visit.weekday
  json.first_time_visitors visit.first_time_visitors
  json.recurring_visitors visit.recurring_visitors
  json.minutes visit.minutes
  json.seconds visit.seconds
end
