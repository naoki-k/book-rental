module Events
  BookCreated = Class.new(RailsEventStore::Event)
  BookEdited = Class.new(RailsEventStore::Event)
  BookDeleted = Class.new(RailsEventStore::Event)
  BookRented = Class.new(RailsEventStore::Event)
  BookReturned = Class.new(RailsEventStore::Event)
end
