require 'rspec'
require 'contact'
require 'mailing_address'

describe Contact do
  describe "#contact_list" do
    it 'shows the contact list saved in contacts' do
      new_contact = Contact.new({ "first_name" => "bob",
                                  "last_name" => "jim",
                                  "job_title" => "manager",
                                  "company" => "water sports inc"})

      expect(new_contact.first_name).to(eq("bob"))
      expect(new_contact.last_name).to(eq("jim"))
      expect(new_contact.job_title).to(eq("manager"))
      expect(new_contact.company).to(eq("water sports inc"))
    end
  end
end

describe Mailing_Address do
  describe "#mailing_address" do
    it 'creates a new mailing list' do
      mailing = Mailing_Address.new({"street_address" => "400 SW 6th",
                                    "city" => "Portland",
                                    "state" => "Oregon",
                                    "zip" => 97219 })
      expect(mailing.street_address).to(eq("400 SW 6th"))
      expect(mailing.city).to(eq("Portland"))
      expect(mailing.state).to(eq("Oregon"))
      expect(mailing.zip).to(eq(97219))
    end
  end
end
