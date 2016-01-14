require 'pry'
class Contact
  @@contacts = []
  attr_reader(:first_name, :last_name, :job_title, :company, :phone_number, :mailing_address, :email_address, :id)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch("first_name")
    @last_name = attributes.fetch("last_name")
    @job_title = attributes.fetch("job_title")
    @company = attributes.fetch("company")
    @phone_number = attributes.fetch("phone_number")
    @mailing_address = attributes.fetch("mailing_address")
    @email_address = attributes.fetch("email_address")
    @id = @@contacts.length + 1

    @@contacts.push( self )
  end

  define_singleton_method(:add) do |contact|
    @@contacts.push(contact)
  end

  define_singleton_method(:get) do
    return @@contacts
  end

  define_singleton_method(:get_by_id) do |id|
    @@contacts.each do |contact|
      if contact.id == id.to_i
        return contact
      end
    end
    return nil
  end
end
