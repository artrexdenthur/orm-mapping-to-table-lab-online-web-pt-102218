class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  attr_reader :id
  attr_accessor :name, :grade
  
  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
  end
  
  def self.create_table
    DB[:conn].execute << -EOF
                            CREATE TABLE IF NOT EXISTS students (
                              id INTEGER PRIMARY KEY,
                              name TEXT,
                              grade INTEGER);
                          EOF
  end
  
  def self.drop_table
    DB[:conn].execute("DROP TABLE students;")
  
end
