class Mailing_Address
  attr_reader(:street_address, :city, :state, :zip)

  define_method(:initialize) do |attributes|
    @street_address = attributes.fetch("street_address")
    @city = attributes.fetch("city")
    @state = attributes.fetch("state")
    @zip = attributes.fetch("zip")
  end
end
