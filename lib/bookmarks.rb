require 'pg'
class Bookmark

  def self.all
    begin

    con = PG.connect :dbname => 'bookmark_manager', :user => 'lucybarber'

    rs = con.exec "SELECT * FROM bookmarks"

    rs.map { |bookmark| bookmark['url'] }.join("\n")
    # rs.each do |row|
    #   puts "%s %s" % [ row['id'], row['url'] ]
    end
  end

  end
