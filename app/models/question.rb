class Question

  include DataMapper::Resource

  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :text, String
  property :answerType, String
  property :default, String
  property :mandatory, Boolean

# line does not work?
   belongs_to :questionaire, :required => true

end