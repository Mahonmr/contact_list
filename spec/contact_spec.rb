require 'rspec'
require 'contact'
require 'mailing_address'
require 'phone_number'

describe Contact do
  describe "#contact_list" do
    it 'shows the contact list saved in contacts' do
      phone_number = Phone_Number.new( {"area_code" => 123, "number" => 4541234})
      phone_number_two = Phone_Number.new( {"area_code" => 342, "number" => 2344423})

      new_contact = Contact.new({ "first_name" => "bob",
                                  "last_name" => "jim",
                                  "job_title" => "manager",
                                  "company" => "water sports inc",
                                  "phone" => [phone_number, phone_number_two]})

      expect(new_contact.first_name).to(eq("bob"))
      expect(new_contact.last_name).to(eq("jim"))
      expect(new_contact.job_title).to(eq("manager"))
      expect(new_contact.company).to(eq("water sports inc"))
      expect(new_contact.phone_number).to(eq([phone_number, phone_number_two]))

    end
  end
end

describe Mailing_Address do
  describe "#mailing_address" do
    it 'creates a new mailing list' do
      mailing = Mailing_Address.new({"street_address" => "400 SW 6th",
                                    "city" => "Portland",
                                    "state" => "Oregon",
                                    "zip" => 97219,
                                    "type" => "school" })
      expect(mailing.street_address).to(eq("400 SW 6th"))
      expect(mailing.city).to(eq("Portland"))
      expect(mailing.state).to(eq("Oregon"))
      expect(mailing.zip).to(eq(97219))
      expect(mailing.type).to(eq("school"))
    end
  end
end

describe Phone_Number do
  describe "#phone_number" do
    it 'creates a phone number' do
        number = Phone_Number.new( {"area_code" => 342, "number" => 2344321})
        expect(number.area_code).to(eq(342))
        expect(number.number).to(eq(2344321))
    end
  end
end
