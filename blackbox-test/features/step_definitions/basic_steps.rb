Given(/^I have a website url (.*)$/) do |url|
  @url = url
end

Given(/^I have an endpoint (.*)$/) do |endpoint|
  @endpoint = @url + endpoint
end

When(/^I send request GET to this endpoint$/) do
  @response = Excon.get(@endpoint)
end

Then(/^I should receive status code (\d+)$/) do |status|
  expect(@response.status.to_s).to eq status
end

Then(/^I should receive body (.*)$/) do |body|
  expect(@response.body).to eq body
end

When(/^I send request POST to this endpoint with data:$/) do |table|
  array = table.hashes
  array.each {|hash| @data = hash.to_json}
  @response = Excon.post(@endpoint, :body => @data)
end

When(/^I send request PUT to this endpoint with data:$/) do |table|
  array = table.hashes
  array.each {|hash| @data = hash.to_json}
  @response = Excon.put(@endpoint, :body => @data)
end

When(/^I send request DELETE to this endpoint$/) do
  @response = Excon.delete(@endpoint)
end