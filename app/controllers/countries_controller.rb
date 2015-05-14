class CountriesController < ApplicationController

	def index
		#@country = Country.all
		@countries_array = Unirest.get("#{ENV["API_BASE_URL"]}/countries.json", :headers => {"X-User-Email" => "ystwerski@yahoo.com", "Autherization" => "Token token #{ENV["security"]}").body["countries"]
		@countries = []
		@countries_array.each do |country_hash|
			@countries << Country.new(country_hash)
		end
		@counter_static = @countries.count
		@counter = 1
	end

	def show
		@kountry = Country.find(params[:id])
		@country = Country.original(params[:id])
		# @employee = Unirest.get("http://localhost:3000/employees/#{params[:id]}.json").body
		# @country = Unirest.get("http://localhost:3001/countries/#{params[:id]}.json").body
		# @kountry = Country.new(@country)
	end

	def new

	end

	def create
		@created = Unirest.post("#{ENV["API_BASE_URL"]}/api/v1/countries.json", :headers => {"Accept" => "application/json"}, :parameters => {:size => params[:size], :name => params[:name], :population => params[:population], :continent => params[:continent], :government_type => params[:government_type], :highest_officer => params[:highest_officer]}).body
		redirect_to government_path(@created["id"])
	end

end
