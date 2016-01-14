class Email_Address
  attr_reader(:email_address)

  define_method(:initialize) do |attributes|
    @email_address = attributes.fetch("email_address")
  end
end
