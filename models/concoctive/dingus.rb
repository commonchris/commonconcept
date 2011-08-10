# supertype - concoctive aspect
class Dingus
   include DataMapper::Resource
  
  property :id, Serial
  property :slug, String
  property :created_at, DateTime
  property :updated_at, DateTime
end