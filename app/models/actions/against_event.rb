##
#
class Actions::AgainstEvent < Action

  field :num, :type => Integer, :default => 0
  field :with_denier, :type => Integer, :default => 0
  field :get_denier, :type => Boolean, :default => false

  validates_numericality_of :num, :greater_than => 0

end
