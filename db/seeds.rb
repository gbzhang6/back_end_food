require 'byebug'
require 'rest-client'
require 'json'

User.delete_all
Restaurant.delete_all

gui = User.create(name: "Gui", password: "gui")
laura = User.create(name: "Laura", password: "laura")
humzah = User.create(name: "Humzah", password: "humzah")
