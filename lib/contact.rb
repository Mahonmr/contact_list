class Contact
  attr_reader(:first_name, :last_name, :job_title, :company, :phone_number)
  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch("first_name")
    @last_name = attributes.fetch("last_name")
    @job_title = attributes.fetch("job_title")
    @company = attributes.fetch("company")
    @phone_number = attributes.fetch("phone")
  end
end


=begin

Start by making a Contact class with properties such as first name, last name,
job title, company. Each contact can have multiple mailing addresses, phone
numbers and email addresses. Create classes for each of these, one at a time.


Then, allow users to select a contact, and add phone numbers. Each phone number
 should have an area code, a number, and a type, like "home" or "cell".
Now, allow users to add multiple emails for their contacts with an address and
type.

=end
