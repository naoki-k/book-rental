module CommandHandlers
  module Books
    class ReturnBook
      def call(command)
        stream = "Domain::Book#{command.uid}"
        entity_data = {
          uid: command.uid,
          title: command.title,
          author: command.author,
          summary: command.summary,
          status: 'returned',
          nickname: command.nickname
        }

        repository = AggregateRoot::Repository.new
        order = repository.load(Domain::Book.new(command.uid), stream)
        order.return(entity_data)
        repository.store(order, stream)
      end
    end
  end
end
