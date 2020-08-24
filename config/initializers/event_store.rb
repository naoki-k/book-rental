Rails.application.config.event_store.tap do |es|
  es.subscribe(Subscribers::Books::BookCreated, to: [Events::BookCreated])
  es.subscribe(Subscribers::Books::BookEdited, to: [Events::BookEdited])
  es.subscribe(Subscribers::Books::BookDeleted, to: [Events::BookDeleted])
  es.subscribe(Subscribers::Books::BookRented, to: [Events::BookRented])
  es.subscribe(Subscribers::Books::BookReturned, to: [Events::BookReturned])
end
