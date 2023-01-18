# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  users.filter { |u| u[:gender] == 'male' }
       .map { |u| u[:birthday][0, 4]}
       .tally
end
# END
