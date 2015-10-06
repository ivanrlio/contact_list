require 'pry'

class Contact
 
  attr_accessor :name, :age, :email

  def initialize(name, age, email)
    @name = name
    @age = age
    @email = email
  end
 
  def to_s
    
  end
 
  ## Class Methods
  class << self
    def create(name, age, email, contact_list)
      count = 0
      contact_list.contacts.each do |contact|
        if email == contact[2] 
          count += 1 
        end
      end
      if count == 0
        contact = Contact.new(name,age, email)
        contact_list.contacts << [contact]
      else
        puts "Sorry, that email is already taken."
      end
    end
 
    def find(term, contact_list)
      contact_list.contacts.find do |contact|
        if contact[0].match(term) || contact[2].match(term)
        puts "You queried the term, '#{term}'."
        puts "Name: #{contact[0]} | Age: #{contact[1]} | Email: #{contact[2]}" 
        end
      end
    end
 
    def all(contact_list)
      contact_list.contacts.each_with_index do |contact, index|
         puts "ID #{index}: Name: #{contact[0]} | Age: #{contact[1]} | Email: #{contact[2]}"
      end
    end
    
    def show(id, contact_list)
      contact_list.contacts.each_with_index do |contact, index|
        if index == id
          puts "Name: #{contact[0]} | Age: #{contact[1]} | Email: #{contact[2]}"
          break if index == id
        else
          puts "That ID was not found!"
        end
      end
    end
    
  end
 
end