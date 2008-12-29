# RUBY CONFIG VARIATION

config :block do |c|
  c[:a] = :a
  c[:b] = :b
end

config :param, :a => :a, :b => :b

proxy '/block' do |c|
  c[:a] = :a
  c[:b] = :b
end

proxy '/param', :a => :a, :b => :b
