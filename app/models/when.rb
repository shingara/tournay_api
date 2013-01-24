class When
  include Mongoid::Document
  embedded_in :neighborhood_card
end
