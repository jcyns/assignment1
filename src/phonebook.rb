class PhoneBook
    def initialize
      @entries = {}
    end
  
    def add(name, number, is_listed)
      return false unless validNumber(number)
      
      if @entries[number]
        # If the number exists
        if @entries[number][:is_listed] && is_listed
          # Number is listed and trying to add another listed entry
          return false
        elsif !@entries[number][:is_listed] && is_listed
          # Number is unlisted and trying to add as listed
          return false
        end
      end
  
      # Add or update the entry
      @entries[number] = { name: name, is_listed: is_listed }
      true
    end
  
    def lookup(name)
      # Find the number where name matches and return if it's listed
      @entries.each do |number, entry|
        return number if entry[:name] == name && entry[:is_listed]
      end
      nil
    end
  
    def lookupByNum(num)
      # Return the name associated with the number if the entry is listed
      entry = @entries[num]
      entry && entry[:is_listed] ? entry[:name] : nil
    end
  
    def namesByAc(areacode)
      # Collect names whose phone numbers start with the given area code
      @entries.each_with_object([]) do |(number, entry), names|
        names << entry[:name] if number.start_with?(areacode)
      end
    end
  
    private
  
    def validNumber(number)
      number.match?(/^\d{3}-\d{3}-\d{4}$/)
    end
  end
  
  # Example usage:
  
  phonebook = PhoneBook.new
  
  # Adding entries
  puts phonebook.add("John", "110-192-1862", false) # => true
  puts phonebook.add("Jane", "220-134-1312", true)  # => true
  puts phonebook.add("Jack", "114-192-1862", false) # => true
  puts phonebook.add("Jessie", "110-124-1131", true) # => true
  puts phonebook.add("Ravi", "110", true)            # => false
  
  # Lookup by name
  puts phonebook.lookup("John")   # => nil
  puts phonebook.lookup("Jack")   # => nil
  puts phonebook.lookup("Jane")   # => "220-134-1312"
  puts phonebook.lookup("Jessie") # => "410-124-1131"
  puts phonebook.lookup("Ravi")   # => nil
  
  # Lookup by number
  puts phonebook.lookupByNum("110-192-1862") # => nil
  puts phonebook.lookupByNum("114-192-1862") # => nil
  puts phonebook.lookupByNum("220-134-1312") # => "Jane"
  puts phonebook.lookupByNum("410-124-1131") # => "Jessie"
  
  # Names by area code
  puts phonebook.namesByAc("110") # => ["John", "Jessie"]
  puts phonebook.namesByAc("114") # => ["Jack"]
  puts phonebook.namesByAc("111") # => []
  