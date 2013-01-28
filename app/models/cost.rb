class Cost
  include Mongoid::Document

  field :denier, :type => Integer, :default => 0
  field :citizen, :type => Integer, :default => 0
  field :color, :type => Color
  field :card, :type => Integer

  validate :need_denier_or_citizen

  private

  def need_denier_or_citizen
    if denier < 1 && citizen < 1
      errors.add(:base, :need_define_citizen_or_denier)
    end
  end

end
