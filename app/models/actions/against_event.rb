##
#
class Actions::AgainstEvent < Action

  field :num, :type => Integer, :default => 0
  field :with_denier, :type => Integer, :default => 0
  field :get_denier, :type => Boolean, :default => false

end
