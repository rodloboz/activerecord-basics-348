class OldRestaurant
  attr_accessor :id, :name, :address

  def initialize(atributes = {})
    @id = atributes[:id]
    @name = atributes[:name]
    @address = atributes[:address]
  end

  # CLASS METHODS (CRUD):

  # Restaurant.all => [Restaurant1, Restaurant2, ...]
  def self.all
    # READ
    # TODO: return all Restaurant instances
    rows = DB.execute("SELECT * FROM restaurants")
    rows.map { |row| new(row.transform_keys!(&:to_sym)) }
  end

  # Restaurant.find(5) => Restaurant5
  def self.find(id)
    # READ
    # TODO: find a specific Restaurant instance
    row = DB.execute("SELECT * FROM restaurants WHERE id = #{id}")
            .first

    return nil if row.nil?

    new(row.transform_keys!(&:to_sym))
  end

  # Restaurant.create(name: "Guido`s", address: "VIC")
  # => Restaurant instance
  def self.create(attributes = {})
    new(attributes).save
  end

  # INSTANCE METHODS (CRUD):

  # restaurant = Restaurant.find(5)
  # restaurant.update(name: "NEW NAME")
  def update(attributes = {})
    # UPDADE
    # TODO: update a specific Restaurant instance
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
    save
  end

  # restaurant = Restaurant.find(5)
  # restaurant.destroy
  def destroy
    # DELETE
    # TODO: removes a specific restaurant
    DB.execute("DELETE FROM restaurants WHERE id = #{@id}")
    nil
  end

  # restaurant = Restaurant.find(5)
  # restaurant.name = "NEW NAME"
  # restaurant.save
  def save
    # CREATE/UPDATE
    # TODO: CREATE if id is nil / UPDATE if there is id
    if @id.nil?
      # TODO: CREATE
      query = "INSERT INTO doctors (name, age, specialty) "\
              "VALUES ('#{@name}', #{@age}, '#{@specialty}')"
      DB.execute(query)
    else
      # TODO: UPDATE
      query = "UPDATE doctors SET name = '#{@name}', "\
              "age = #{@age}, specialty = '#{@specialty}' "\
              "WHERE id = #{@id}"
      DB.execute(query)
    end
    self
  end
end
