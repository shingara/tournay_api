##
#
class Actions::CopyCard < Action

  field :color, :type => Color
  field :activate, :type => Boolean, :default => false

  field :building, :type => Boolean, :default => false
  field :prestige, :type => Boolean, :default => false
  field :people, :type => Boolean, :default => false

  validate :need_building_prestige_or_people

  private

  def need_building_prestige_or_people
    if !building &&
      !prestige &&
      !people
      errors.add(:base, 'need_building_prestige_or_people')
    end
  end

end
