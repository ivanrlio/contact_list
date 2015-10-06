## TODO: Implement CSV reading/writing
require 'csv'
require 'pry'

class ContactDatabase
  attr_accessor :contacts
  def initialize
    @contacts = CSV.parse(File.read('contacts.csv'))
  end

  def write_csv(arr, contact_list)
    binding.pry
    count = 0
    contact_list.contacts.each do |contact|
      if arr[2] == contact[2]
        count += 1
      end 
    end
    if count == 0
      CSV.open('contacts.csv', 'a') do |line|
        line << [arr[1], arr[2], arr[3]]
        p line
      end
    else
      puts "Sorry, that email is already taken."
      return false
    end
  end
end 



