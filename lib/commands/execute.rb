module Commands
  module Execute
    def execute(command)
      command.validate!
      handler_for(command).call(command)
    end

    private

    def handler_for(command)
      {
        Commands::Books::CreateBook => CommandHandlers::Books::CreateBook.new,
        Commands::Books::EditBook => CommandHandlers::Books::EditBook.new,
        Commands::Books::DeleteBook => CommandHandlers::Books::DeleteBook.new,
        Commands::Books::RentBook => CommandHandlers::Books::RentBook.new,
        Commands::Books::ReturnBook => CommandHandlers::Books::ReturnBook.new
      }.fetch(command.class)
    end
  end
end
