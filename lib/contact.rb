class Contact
  attr_reader(:name, :phone, :email, :relationship)
  define_method(:initialize) do |attributes|
    @name = attributes.fetch("name")
    @phone = attributes.fetch("phone")
    @email = attributes.fetch("email")
    @relationship = attributes.fetch("relationship")
  end
end
