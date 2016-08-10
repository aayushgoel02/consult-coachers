# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Question.create(module: "Value Chain", questionnumber: 1, ordernumber: 1, questiontype: 1, question: "What would you like to investigate?", options: "Production;Distribution;Retail;Consumer", answer: "Production", suggestions: "Correct Choice!;No problem in distribution;No problem in retail;No problem on consumer end")
Question.create(module: "Value Chain", questionnumber: 1, ordernumber: 2, questiontype: 2, question: "Why is the factory not producing enough candy?", answer: "Shut down", suggestions: "Correct Answer!;Wrong answer.")
Question.create(module: "Value Chain", questionnumber: 2, ordernumber: 1, questiontype: 1, question: "What would you like to investigate?", options: "Production;Distribution;Retail;Consumer", answer: "Retail", suggestions: "No problem in production;No problem in distribution;Correct Choice!;No problem on consumer end")
Question.create(module: "Value Chain", questionnumber: 2, ordernumber: 2, questiontype: 2, question: "Why is retailer not selling client's brand of beer?", answer: "Cheaper beer", suggestions: "Correct Answer!;Wrong answer.")

