json.array! @daily_visits do |visit|
  json.id visit.id
  json.date visit.date
  json.weekday visit.weekday
  json.first_time_visitors visit.first_time_visitors
  json.recurring_visitors visit.recurring_visitors
end
