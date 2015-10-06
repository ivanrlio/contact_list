require 'pry'

class Contact
 
  attr_accessor :name, :age, :email

  def initialize(name, age, email)
    @name = name
    @age = age
    @email = email
  end

  ## Class Methods
  class << self
    def create(arr, contact_list)
      count = 0
      contact_list.contacts.each do |contact|
        if arr[3] == contact[2] 
          count += 1 
        end
      end
      if count == 0
        contact = Contact.new(arr[1], arr[2], arr[3])
        contact_list.contacts << [contact]
      else
        puts "Sorry, that email is already taken."
      end
    end
 
    def find(arr, contact_list)
      contact_list.contacts.each_with_index do |contact, index|
        if contact[0].match(arr[1]) || contact[2].match(arr[1])
        puts "You queried the term, '#{arr[1]}'.\n"
        puts "ID #{index} | Name- #{contact[0]} | Age- #{contact[1]} | Email- #{contact[2]}\n" 
        end
      end
    end
 
    def all(contact_list)
      contact_list.contacts.each_with_index do |contact, index|
         puts "ID #{index} | Name- #{contact[0]} | Age- #{contact[1]} | Email- #{contact[2]}"
      end
    end
    
    def show(arr, contact_list)
      contact_list.contacts.each_with_index do |contact, index|
        if index == arr[1].to_i
          puts "ID #{index}: Name- #{contact[0]} | Age- #{contact[1]} | Email- #{contact[2]}"
          break if index == arr[1].to_i
        else
          puts "That ID was not found!"
        end
      end
    end
  end
end