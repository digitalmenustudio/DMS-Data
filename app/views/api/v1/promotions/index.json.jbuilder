json.array! @promotions do |promotion|
  json.id promotion.id
  json.name promotion.name
  json.title promotion.title
  json.view_count promotion.view_count
end
