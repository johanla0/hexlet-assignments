# frozen_string_literal: true

# BEGIN
def compare_versions(ver1, ver2)
  maj1, min1 = ver1.split('.').map(&:to_i)
  maj2, min2 = ver2.split('.').map(&:to_i)

  return 1 if maj1 > maj2

  return -1 if maj1 < maj2

  return 1 if min1 > min2

  return -1 if min1 < min2

  0
end
# END
