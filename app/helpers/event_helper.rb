module EventHelper
  def action_of(event)
    case event
    when Events::BookCreated
      'Created'
    when Events::BookEdited
      'Edited'
    when Events::BookDeleted
      'Deleted'
    when Events::BookRented
      'Rented'
    when Events::BookReturned
      'Returned'
    else
      'Unknown action'
    end
  end
end
