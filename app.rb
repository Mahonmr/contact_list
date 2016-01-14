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
  mailing_address_street = params.fetch("mailing_address_street")
  mailing_address_city = params.fetch("mailing_address_city")
  mailing_address_zip = params.fetch("mailing_address_zip")
  mailing_address_type = params.fetch("mailing_address_type")
  mailing_address_state = params.fetch("mailing_address_state")
  email_address = params.fetch("email_address")

  new_number = Phone_Number.new( { "number" => phone_number })
  new_mailing = Mailing_Address.new( {"street_address" => mailing_address_street,
                                      "city" => mailing_address_city,
                                      "zip" => mailing_address_zip,
                                      "type" => mailing_address_type,
                                      "state" => mailing_address_state})
  new_email = Email_Address.new( "email_address" => email_address )

  contact = Contact.new({"first_name" => first_name,
                         "last_name" => last_name,
                         "job_title" => job,
                         "company" => company,
                         "phone_number" => [new_number],
                         "mailing_address" => [new_mailing],
                         "email_address" => [new_email] })
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
    @id = params[:id].to_i
    erb(:contact)
  else
    redirect '/'
  end
end

post '/add_number/:id' do
  if params.fetch("phone").length > 0
    contact = Contact.get_by_id( params[:id] )
    new_number = Phone_Number.new({"number" => params.fetch("phone")})
    contact.add_phone(new_number)
  end
  redirect('/contact/' + params[:id])
end

post '/add_email/:id' do
  contact = Contact.get_by_id( params[:id] )
  new_email = Email_Address.new( {"email_address" => params.fetch( "email" )})
  contact.add_email( new_email )
  redirect '/contact/' + params[:id]
end

post '/add_mail/:id' do
  contact = Contact.get_by_id( params[:id] )
  new_mail = Mailing_Address.new({"street_address" => params.fetch("street_address"),
                                  "city" => params.fetch("city"),
                                  "state" => params.fetch("state"),
                                  "zip" => params.fetch("zip"),
                                  "type" => params.fetch("type")})
  contact.add_address(new_mail)
  redirect '/contact/' + params[:id]
end
