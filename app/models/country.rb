class Country

	attr_reader :name, :population, :size, :continent, :government_type, :highest_officer

	def initialize(hash_of_country_info)
		@name = hash_of_country_info["Name"]
		@population = hash_of_country_info["Population"]
		@size = hash_of_country_info["size"]
		@continent = hash_of_country_info["Continent"]
		@government_type = hash_of_country_info["government_type"]
		@highest_officer = hash_of_country_info["highest_officer"]
	end

	def self.find(id)
		country = Unirest.get("#{ENV["API_BASE_URL"]}/api/v1/countries/#{id}.json", :headers => {"X-User-Email" => "ystwerski@yahoo.com", "Autherization" => "Token token #{ENV["security"]}").body
		return Country.new(country)
	end

	def self.original(id)
		 country = Unirest.get("#{ENV["API_BASE_URL"]}/api/v1/countries/#{id}.json", :headers => {"X-User-Email" => "ystwerski@yahoo.com", "Autherization" => "Token token #{ENV["security"]}").body
		 return Country.new(country)
	end

	def self.all
		countries = Unirest.get("#{ENV["API_BASE_URL"]}/api/v1/countries.json", :headers => {"X-User-Email" => "ystwerski@yahoo.com", "Autherization" => "Token token #{ENV["security"]}").body
		return Country.new(countries)
	end
end
