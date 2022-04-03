class Post < Granite::Base
  connection mysql
  table posts

  column id : Int64, primary: true
  column title : String?
  column body : String?
  timestamps
end
