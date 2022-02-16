# FuzzySearch
This was the first objective that I attempted. Since I have no experience with Phoenix, I first had to attempt to understand the file structure and where exactly I should insert my code. It took me quite a few hours to understand the files and how they communicate with one another because I was unable to locate the relevant information in the docs. After spending a while trying to understand Elixir in order to understand the structure (this was a mistake), I got the gist and even eventually found the webpage in the Phoenix docs that explains the file structure. 

I then created a sample query function to see if I could access it through the graphql UI (http://localhost:8000/graphiql).

After all of this research, I realized that there were multiple files that needed to be changed so that I could create the Fuzzy search query. Once I got a grip on creating queries and got a tad bit more familiar with Elixir, I was able to create the general template for a query and adjust it to be able to make do a fuzzy search using Fuzzy find with Ecto (https://fullstackphoenix.com/tutorials/fuzzy-search-in-phoenix-liveview).  I made some slight modifications to the search_product query and the tutorial and I was able to fuzzy search merchant names. I then did the same with users first and last names by concatenating them before searching. 

As for transaction amount min and max query, I actually used the "from m in Transaction" method that I had learned in from fuzzy searching to create greater-than and less-than conditions for the amount provided by the query.

# Adding Companies to the App
To get started on this objective, I essentially copied the Merchants object code, it's schema, mutations, queries, and resolver and made the appropriate modifications to fit the objective.

I had some issues accessing it but quickly realized that in order to setup it up, I needed to add a migration so I did so. I also ran into some issues with setting up the migration but was eventually able to get it working by clearing and rerunning all migrations. 

I then attempted to add functionality to transactions to reduce the available credit amount for the company involved in each transaction. **I failed to do so** and I decided to move on the next objective

# Decimal Amounts in Transactions
After considering weighing my understanding of Ecto and Elixir thus far, this seemed like the easiest task left over. First, I added changed the "amount" argument in the create_transaction mutation to accept floating points and then modified Transactions.create_transaction to multiply the "amount" attribute in the incoming map by 100 and convert the resulting value to an integer to represent the number of cents.

I then went on to convert the query to have decimal places by changing the Transactions.list_transactions helper function to go through the list of returned transactions and divide each "amount" by 100 to return it back to a decimal. I also had to edit the transaction schema to allow me to return the floating point "amount".

# How Long This Took Me

To be entirely honest, this assignment took me a very long time to complete. I had a whole host of issues running the boilerplate code as some of it was obsolete and I had to make many adjustments to get it up and running at all which cut into my time significantly. I'm not sure I can give an accurate estimate but I certainly spent over 20 hours on this and was still unable to complete the assignment. 

