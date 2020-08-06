require 'pg'
class Bookmark
  attr_reader :id, :url, :title
  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end
  def self.all
    select_env
    results = @connection.exec( "SELECT * FROM bookmarks;" )
    results.map { |bookmark| Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title']) }
  end

  def self.create(url:, title:)
    select_env
    @connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.select_env
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end
