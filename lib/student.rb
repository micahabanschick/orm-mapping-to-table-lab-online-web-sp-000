class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
  attr_accessor :name, :grade
  attr_reader :id 
  
  @@all = []
  
  def initialize(name, grade)
    @name = name 
    @grade = grade 
    @@all << self 
  end
  #binding.pry 
  
  def id
    @id ||= Student.all.length
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.create_table
    create_student_table =  
      "CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT);"
    DB[:conn].execute(create_student_table)
  end 
  
  def self.drop_table
    drop_student_table =  
      "DROP TABLE IF EXISTS students;"
    DB[:conn].execute(drop_student_table)
  end 
  
  def save 
    # Student.create_table 
    current_student_row = 
      "INSERT INTO students (id, name, grade) VALUES (?, ?, ?)"
    DB[:conn].execute(current_student_row, self.id, self.name, self.grade)
  end 
  
  def self.create(name: name, grade: grade) 
    new_student_instance = self.new(name, grade)
    new_student_instance.save
  end 
  
end
