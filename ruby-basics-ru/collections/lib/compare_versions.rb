# frozen_string_literal: true

# BEGIN
def compare_versions(ver1, ver2)
  v1 = ver1.split('.').map(&:to_i)
  v2 = ver2.split('.').map(&:to_i)

  v1 <=> 2
end
# END
