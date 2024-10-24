json.array! @items do |item|
  json.id item.id
  json.name item.name
  json.item_type item.item_type
  json.clicks item.clicks
  json.likes item.likes
end
