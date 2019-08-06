require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?
require_relative "./models/wizard"
require "csv"

set :bind, '0.0.0.0'  # bind to all interfaces

def retrieve_id_for_last_csv_resource(file_path)
  wizards = CSV.readlines("wizards.csv", headers: true)[-1]["id"].to_i
end

get '/' do
  redirect "/wizards"
end

get "/wizards/new" do
  erb :"wizards/new"
end

post "/wizards" do
  last_id = retrieve_id_for_last_csv_resource("articles.csv") + 1
  @wizard_name = params["wizard_name"]
  @wizard_age = params["wizard_age"]
  @wizard_power_type = params["wizard_power_type"]

  if wizard_name != ""
    CSV.open("wizards.csv", "a") do |csv|
      csv << [last_id.to_s, wizard_name, wizard_age, wizard_power_type]
    end

    redirect "/wizards"
  else
    @error = "Please provide a wizard name"

    erb :"wizards/new"
  end
end

get "/wizards" do
  # @wizards = CSV.readlines("wizards.csv")

  # @wizards = []
  # CSV.foreach("wizards.csv", headers: true) do |row|
  #   @wizards << row.to_h
  # end

  @wizards = Wizard.all

  erb :wizards
end

get "/wizards/:id" do
  CSV.foreach("wizards.csv", headers: true) do |wizard_row|
    if wizard_row["id"].to_i == params["id"].to_i
      @wizard = wizard_row.to_h
    end
  end

  erb :show
end
