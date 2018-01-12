# RecommenderSystem

Ui.R is the User interface. It displays the buttons, the links, and the results.

Server.R is everything that happens behind the scenes. Using the data from the users' ratings and the options selected in the interface, it gets the best recommendations: 

    Popular - Recommends the most popular movies. Good for cold starts.
    Random -  Suggests a random movie
    ICBF - Item-based collaborative filtering
    UCBF - User-based collaborative filtering
