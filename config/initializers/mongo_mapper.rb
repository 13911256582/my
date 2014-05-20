host='127.0.0.1'
port=27017
pool_size=5
pool_timeout=10
MongoMapper.connection = Mongo::Connection.new(host, port, :pool_size=>pool_size, :pool_timeout=>pool_timeout)
MongoMapper.database='development'