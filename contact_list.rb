require_relative 'contact'
require_relative 'contact_database'
require 'pry'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

@contact_list = ContactDatabase.new 

ARGV << 'help' if ARGV.empty?

  if ARGV[0] == 'help'
    puts "Here is a list of available commands:\n\n"
    puts "- new ; To create a new contact, e.g. ruby app_run.rb new name age email\n\n"
    puts "- list ; To list all contacts, e.g. ruby app_run.rb list\n\n"
    puts "- show ; To show a contact, e.g. ruby app_run.rb show id#.\n\n"
    puts "- find ; To find a contact, type in a substring of the individual you would like to find, e.g.\n\n"
    puts "ruby app_run.rb gmail.com.\n\n"
    puts "Please reboot the application."
  end

  if ARGV[0] == 'new' #works fully
    check1 = @contact_list.write_csv(ARGV, @contact_list)
    if check1 == true
      Contact.create(ARGV[1], ARGV[2], ARGV[3], @contact_list) 
    end
  end       
  
  if ARGV[0] == 'list' #works FULLY
    Contact.all(@contact_list)
  end
  
  if ARGV[0] == 'show'
    Contact.show(ARGV, @contact_list)
  end

  if ARGV[0] == 'find'
    Contact.find(ARGV, @contact_list)
  end
  



