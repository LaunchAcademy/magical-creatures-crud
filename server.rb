require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?
require_relative "./models/wizard"
require "csv"

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  redirect "/wizards"
end

get "/wizards/new" do
  erb :"wizards/new"
end

post "/wizards" do
  wizard_name = params["wizard_name"]
  wizard_age = params["wizard_age"]
  wizard_power_type = params["wizard_power_type"]

  CSV.open("wizards.csv", "a") do |csv|
    csv << [wizard_name, wizard_age, wizard_power_type]
  end

  redirect "wizards"
  # what if something goes wrong? What do we do?
end

get "/wizards" do
  # @wizards = CSV.readlines("wizards.csv")
  @wizards = []
  CSV.foreach("wizards.csv", headers: true) do |row|
    @wizards << row.to_h
  end

  erb :wizards
end

get "/wizards/:id" do
  # retrieve_id_for_last_element("articles.csv")
  #
  #
  # CSV.foreach("wizards.csv", headers: true) do |wizard_row|
  #   if wizard_row[:id] == params["id"].to_i
  #     @wizard = wizard_hash
  #   end
  # end

  erb :show
end

# def retrieve_id_for_last_csv_resource(file_path)
#   CSV.readlines("articles.csv", headers: true).last["id"]
# end
