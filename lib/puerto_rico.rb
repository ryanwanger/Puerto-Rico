module PuertoRico
  Dir["./puerto_rico/*.rb"].each {|file| require file }
  Dir["./puerto_rico/*/*.rb"].each {|file| require file }
  Dir["./puerto_rico/*/*/*.rb"].each {|file| require file }
end