require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  @num = params.fetch("number").to_f
  @the_result = @num ** 2
 erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  @num = params.fetch("user_number").to_f
  @the_result = @num ** 0.5
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @apr = params.fetch("apr").to_f
  @num_of_years = params.fetch("year").to_i

  @principal = params.fetch("principal").to_i

  periods_remaining = @num_of_years * 12
  monthly_interest_rate = @apr.round(4) / 100 / 12
  numerator = @principal * monthly_interest_rate * (1 + monthly_interest_rate)** periods_remaining
  denominator = (1 + monthly_interest_rate)** periods_remaining - 1

  @monthly_payment = numerator / denominator

  @formatted_apr = sprintf("%.4f", @apr)
  erb(:payment_results)
end

get("/random/new") do
  
  erb(:random_new)
end

get("/random/results") do
  @min = params.fetch("min").to_i
  @max = params.fetch("max").to_i
  @result = Random.new
  @newresult = @result.rand(@min..@max)
  erb(:random_results)
end
