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
