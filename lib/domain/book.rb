module Domain
  class Book
    include AggregateRoot

    attr_reader :uid, :title, :author, :summary, :status, :nickname

    def initialize(uid)
      @uid = uid
    end

    def create(data)
      apply Events::BookCreated.new(data: data)
    end

    def edit(data)
      apply Events::BookEdited.new(data: data)
    end

    def delete(data)
      apply Events::BookDeleted.new(data: data)
    end

    def rent(data)
      apply Events::BookRented.new(data: data)
    end

    def return(data)
      apply Events::BookReturned.new(data: data)
    end

    on Events::BookCreated do |event|
      @title = event.data[:title]
      @author = event.data[:author]
      @summary = event.data[:summary]
      @status = event.data[:status]
      @nickname = event.data[:nickname]
    end

    on Events::BookEdited do |event|
      @title = event.data[:title]
      @author = event.data[:author]
      @summary = event.data[:summary]
      @status = event.data[:status]
      @nickname = event.data[:nickname]
    end

    on Events::BookDeleted do |event|
      @status = event.data[:status]
      @nickname = event.data[:nickname]
    end

    on Events::BookRented do |event|
      @title = event.data[:title]
      @author = event.data[:author]
      @summary = event.data[:summary]
      @status = event.data[:status]
      @nickname = event.data[:nickname]
    end

    on Events::BookReturned do |event|
      @title = event.data[:title]
      @author = event.data[:author]
      @summary = event.data[:summary]
      @status = event.data[:status]
      @nickname = event.data[:nickname]
    end
  end
end
