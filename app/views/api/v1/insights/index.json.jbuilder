json.array! @insights do |insight|
  json.id insight.id
  json.title insight.title
  json.content insight.content.body
end
