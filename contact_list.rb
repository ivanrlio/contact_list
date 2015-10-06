require_relative 'contact'
require_relative 'contact_database'
require 'pry'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets
class ContactList

  def initialize
    @contact_list = ContactDatabase.new
  end

  ARGV << 'help' if ARGV.empty?
  binding.pry
    if ARGV[0] == 'help'
      puts "Here is a list of available commands:\n"
      puts "To create a new contact, e.g. ruby app_run.rb new name age email"
      puts "To list all contacts, e.g. ruby app_run.rb list\n"
      puts "To show a contact, e.g. ruby app_run.rb show id#.\n"
      puts "To find a contact, type in a substring of the individual you would like to find, e.g.\n"
      puts "ruby app_run.rb gmail.com."
    end

    if ARGV[0] == 'new'
      binding.pry
      check1 = @contact_list.write_csv(ARGV, @contact_list)
      if check1 == true
        Contact.create(ARGV[1], ARGV[2], ARGV[3], @contact_list) #adds 2 of each (for the values that return false, cody and john)
      end
    end       
    
    if ARGV[0] == 'list' #works
      Contact.all(@contact_list)
    end
    
    if ARGV[0] == 'show'
      puts "What ID number would you like to see?"
      id = gets.chomp.to_i
      Contact.show(id, @contact_list)
    end

    if ARGV[0] == 'find'
      puts "Enter a term to see if it relates to the name or email address of someone in the database."
      term = gets.chomp
      Contact.find(term, @contact_list)
    end
end



