require 'fileutils'

namespace :mongodb do
  desc "start mongodb"
  task :start do
    #exec('mongod run --config /usr/local/Cellar/mongodb/1.2.2-x86_64/mongod.conf')
    FileUtils.mkdir('/tmp/mongodb') if not File.exists?('/tmp/mongodb')
    exec('mongod run -vvvvv --dbpath /tmp/mongodb')
  end
end

task :clean do
  exec('rm rmongo-0.1.0.gem')
end
