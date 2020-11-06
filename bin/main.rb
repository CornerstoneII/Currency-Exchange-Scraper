#!/usr/bin/env ruby
def get_user_data(check_curr_sym)
    input = ''
    loop do
        input = gets.chomp.downcase
        break if check_curr_sym.include?(input) || input.empty?
        puts input + 'No Data Found'
    end
    input
end

end
# 2. Display Welcome message

# 3. Fetch Data for all exchange rates

# 4. Ensure User has internet connection to run program

# 5. Display table data for all exchange rates in other currencies if connection true

# 6. Else end program

# 7. Display currency rate according to user input data

