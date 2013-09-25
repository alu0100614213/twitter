require 'twitter'
require './configure'

name = ARGV[0]
num = (ARGV[1] || 4).to_i

user = Hash.new

friends = Twitter.friend_ids(name).ids[0..num]

friends.each  do |id|

  f = Twitter.user(id)
  if (f.protected.to_s != "true")
    user[f.screen_name.to_s] = f.followers_count
  end

end

user.sort_by {|k,v| -v}.each { |user, count| puts "#{user}, #{count}" }

