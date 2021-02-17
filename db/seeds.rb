# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
haikus = [
    {id:14,haiku1:'tesuto1',haiku2:'tesuto1',haiku3:'tesuto1',user_id:'4'},
    {id:15,haiku1:'tesuto2',haiku2:'tesuto2',haiku3:'tesuto2',user_id:'4'},
    {id:16,haiku1:'tesuto3',haiku2:'tesuto3',haiku3:'tesuto3',user_id:'4'},
    {id:17,haiku1:'tesuto4',haiku2:'tesuto4',haiku3:'tesuto4',user_id:'4'},
    {id:18,haiku1:'tesuto5',haiku2:'tesuto5',haiku3:'tesuto5',user_id:'4'},
    {id:19,haiku1:'tesuto6',haiku2:'tesuto6',haiku3:'tesuto6',user_id:'4'},
]
ActiveRecord::Base.transaction do
    haikus.each do |haiku|
        Haiku.create!(haiku)
    end
end