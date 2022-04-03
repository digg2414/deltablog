require "granite/adapter/mysql"

Granite::Connections << Granite::Adapter::Mysql.new(name: "mysql", url: ENV["DATABASE_URL"]? || Amber.settings.database_url)
