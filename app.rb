require 'sinatra'
require 'sinatra/reloader'
require './lib/contact'
require './lib/email_address'
require './lib/mailing_address'
require './lib/phone_number'
require 'pry'

get '/' do
  @contacts = Contact.get
  erb(:index)
end

post '/post_contact' do
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  job = params.fetch("job")
  company = params.fetch("company")
  phone_number = params.fetch("phone_number")
  mailing_address = params.fetch("mailing_address")
  email_address = params.fetch("email_address")

  contact = Contact.new({"first_name" => first_name,
                         "last_name" => last_name,
                         "job_title" => job,
                         "company" => company,
                         "phone_number" => [phone_number],
                         "mailing_address" => [mailing_address],
                         "email_address" => [email_address] })
  redirect '/'
end

get '/contact/:id' do
  contact = Contact.get_by_id( params[:id] )

 if contact
    @first_name = contact.first_name
    @last_name = contact.last_name
    @job_title = contact.job_title
    @company = contact.company
    @phone_number = contact.phone_number
    @mailing_address = contact.mailing_address
    @email_address = contact.email_address 
    erb(:contact)
  else
    redirect '/'
  end
end
