require 'rspec'
require 'contact'

describe Contact do
  describe "#contact_list" do
    it 'shows the contact list saved in contacts' do
      new_contact = Contact.new({"name" => "friend", "phone" => 0000000000, "email" => "email@email.com", "relationship" => "co-worker"})
      expect(new_contact.name).to(eq("friend"))
      expect(new_contact.phone).to(eq(0000000000))
      expect(new_contact.email).to(eq("email@email.com"))
      expect(new_contact.relationship).to(eq("co-worker"))
    end
  end
end
