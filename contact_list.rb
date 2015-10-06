require_relative 'contact'
require_relative 'contact_database'
require 'pry'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets
class ContactList

  def initialize
    @contact_list = ContactDatabase.new
    
  end
 
  def initiate
    puts "Please enter 'help' for more info."
    user = gets.chomp
    case user
      when 'help' then puts "Here is a list of available commands:\n"\
      "new - Create a new contact\nlist - List all contacts\nshow - Show a contact\n"\
      "find - Find a contact\nPlease type a command."
      command = gets.chomp
      case command
        when 'new' # works 
          puts "What is your name?"
          name = gets.chomp
          puts "What is your age?"
          age = gets.chomp
          puts "What is your email?"
          email = gets.chomp

          check1 = @contact_list.write_csv(name, age, email, @contact_list)
          if check1 == true
            Contact.create(name, age, email, @contact_list) #adds 2 of each (for the values that return false, cody and john)
          end       
        when 'list' #works
          Contact.all(@contact_list)
        when 'show'
          puts "What ID number would you like to see?"
          id = gets.chomp.to_i
          Contact.show(id, @contact_list)
        when 'find'
          puts "Enter a term to see if it relates to the name or email address of someone in the database."
          term = gets.chomp
          Contact.find(term, @contact_list)
        else
      end 
    end
  end
end



