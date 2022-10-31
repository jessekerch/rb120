class Flight

  def initialize(flight_number)
    @flight_number = flight_number
    @database_handle = Database.init
  end
  
  private
  
  def database_handle
    @database_handle
  end
  
  def database_handle=(database_handle)
    @database_handle = database_handle
  end

end