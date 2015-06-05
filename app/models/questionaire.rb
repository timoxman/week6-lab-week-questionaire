class Questionaire

  include DataMapper::Resource

  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :name,   String, unique: true, message: 'this questionaire has already been built'

end