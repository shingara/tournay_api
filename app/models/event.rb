class Event
  include Mongoid::Document

  embedded_in :event_card

end
