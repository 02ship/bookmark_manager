require 'pg'
class Bookmark
  def self.all
    select_env
    results = @connection.exec( "SELECT * FROM bookmarks;" )
    results.map { |bookmark| bookmark['url'] }
  end

  def self.create(url:)
    select_env
    @connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}');")
  end

  def self.select_env
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end
