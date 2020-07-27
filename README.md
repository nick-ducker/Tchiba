LOGO

# Tchiba

IMAGE

## Screenshots(Collapsible)

### Task allocation and Tracking

For Tchiba, I am using a mixture of strategies and technologies to create, allocate and track tasks. 
Firstly I simply drafted a couple of ideas on paper for the application, before settling on a broad concept I was happy with. I then went a little deeper and touched on some basic user story ideas for how I wanted the application to function.

From here, I moved onto Trello to start synthesizing the technical requirements with a more fleshed out vision of how the app was to be built. This allowed me to map out both the rubric requirements (to easily refer back to), and the technical/document requirements for the application. 

I used this map to then flesh out the idea for Tchiba further. By referring back to the requirements, I was able to build a list of tasks for documentation. At this stage the initial user stories were planned also, to try and bring a bit more dimension to the planning process.

I was then able to create my implementation plan by mixing the user stories (What I want) with the technical requirements (What is required). This gave me a solid structure of code related tasks for when the documentation had been finished. 

As I had ordered my implementation plan and documentation lists in order of what needed to be done, I could simply look to the "master lists" on the left, which had been marked as waiting, doing, or done, then copy them over into my To Do list. 

This allowed me to start using Trello as a way of keeping track of what had been done and what needed to be done.

A typical Trello workflow, once it had been set up:
 1.  Look to the master list that I am currently working on eg docs, implementation, user stories or presentation
 2.  Start with whatever is still in the "doing" phase, otherwise, choose the next item on the list to begin and mark it as "doing"
 3.  Copy the card over into the to do list. 
 4.  Check master lists for any other cards that make sense to do in the same bout of work and repeat step 3.
 5.  Work through items in to do list, moving them through doing and done.
 6.  When all the tasks have been completed, mark them as done on the master list
 7.  Repeat.

I also used a devlog to keep a log of what had been done on what day as the project progressed. 

### Purpose of Application

Tea shops around the world not only sell single origin tea, but also sell tea blends that are generally trademarked under that particular tea shop. 
However, within the tea loving community, there is also a culture around creating your own tea blends and sharing these blends with others. Unfortunately, this culture is somewhat invisible to the general public and overshadowed by the commercial tea brands. 

The purpose of Tchiba is to provide a platform to those humans who have a passion for creating their own tea blends and want to turn a profit off doing so. Tchiba allows them to put these blends and their information online, then sell them for a nominated amount of money.

The goal here is 3 fold. Tchiba aims to support and help grow grassroots tea culture, educate people outside of the community about different ways of approaching tea culture and encourage sustainable ethical approaches to sourcing tea.

## Functionality 

Tchiba is a user based, two sided marketplace. Some fundamental features of this application are:
*  User sign up, log-in and log-out
*  Users can upload tea blends to sell
*  Non-Users and Users can browse Tchiba
*  Users can buy tea blends from other users.
*  Basic authorisation preventing non users from buying products without an account

The above describes the Minimum Viable Product version of Tchiba. The following features were implemented once this framework was in place:
* Image upload for profile images and product images.
* Users have the ability to stay logged in if they navigate away from the page
* Users accounts are email validated
* Users can search through Tchiba using a search term
* Users can filter results using categories and price
* Users can order results
* Buyers can send sellers questions about products
* Reviews and ratings of products
* Cart feature
* Email confirmation of order and order being shipped (Buyer)
* Email confirmation of order being placed (Seller)
* Account details 
  *  Orders shipped/not shipped and payment status (seller/buyer)
  *  Historical orders (seller/buyer)
  *  Receipts (seller/buyer)
  *  Credit (seller)
* Admin page for moderation of content.

## Sitemap

![Tchiba Sitemap](docs/imgs/tchiba_site_map.png)

## Target Audience

Tchiba was created to cater to a large spectrum of tea drinkers. For the tea connoisseurs, Tchiba allows users to create their product with a lot of detail, down to the details behind each part of the blend. Tchiba also allows users to send questions to sellers about particular blends if they want to know more. On the other end of the spectrum, Tchiba also allows easy navigation and exploration, as well as filtering by category and price for people just getting into tea blends who wish to simply see what is popular and well rated at the time according to their budget.  

## Techstack


## User Stories

*  As a User, I want to be able to create, log-in to and log-out of of a personal account
*  As a User, I want the option to to stay signed in on a particular browser if I choose to do so
*  As a User, I want to be able to search through content and filter my results, and order my results
*  As a User, I want to be able to add items to my cart, remove items from my cart and update the quantity of items in the cart
*  As a User, I want to be able to create my own products and display them on the marketplace
*  As a User, I want to be able to add price, detail, categories and images to my products
*  As a User, I want to be able to message a seller and ask questions about a particular product
*  As a Seller, I want an automatically generated report of orders and their status
*  As a Seller, I want to receive notifications that an order has been placed on a product I sell
*  As a Buyer, I want to receive and email for confirmation of order, confirmation of shipping.
*  As a Buyer, I want to see my current orders and order history
*  As an Admin, I want the ability to moderate the content on the application easily from a centralised page

## Wireframes 

### Mobile 

![Mobile wireframe](docs/imgs/mobile_wireframe.png)

### Tablet

![Tablet wireframe](docs/imgs/tablet_wireframe.png)

### Desktop

![Desktop wireframe](docs/imgs/desktop_wireframe.png)

## API's & Gems

*  Devise
*  Rspec
*  Capybara
*  Factory Girl
*  Heroku
*  AWS S3
*  Stripe
*  Mailgun

## Planning phase ERD

![Planned ERD](docs/imgs/tchiba_erd.png)

## Database relations to be implemented

Tchiba is strongly oriented around the interaction of Users via Blends. As such, most of the relations for Tchiba either connect or add attributes/detail to these two tables.

Before implementation, these are the relationships that have been planned. This list was made using the planned ERD above.

#### Primary Tables

*  User
    Has Many or None
      *  Conversations
      *  Blends
      *  Reviews
      *  Orders

    Has one or None
      *  Address 

As previously mentioned, the user sits centrally in the applications framework. One User can own many blends which they create and edit. They have many conversations, which also relate to a blend in question. A user may only have one or no address, but will be required to have an address to create a blend. Lastly, a user can have many orders, either as a buyer or a seller.  

*  Blend
    Belongs to
      *  User
      *  Orders, through Orders Blends

    Has Many
      *  Attributes, through Blends Attributes

    Has Many or None
      *  Images
      *  Reviews
      *  Conversations
      
Blends always belong to a single user. A blend may also belong to multiple orders, through the orders blends join table. When a Blend is created it must have at least one attribute in order to more easily categorize all the products, which is achieved through a blends attributes join table. It also can have many or no images, reviews and conversations.  

#### Secondary Tables

*  Conversation
    Has many
      *  Messages

    Belongs to
      *  Blend
      *  Users

A Conversation always belongs to a particular blend, which is treated as the subject. It also belongs to the two users in question, the buyer and the seller. It has many messages, which exist separately.

*  Order
    Belongs to
      *  Users

    Has many
      *  Blends, through Orders Blends
  
    Has many or None
      *  Transactions

An order is created once someone "checks out" their cart. It belongs to both the seller and the buyer when it is created and also many blends through a join table. It can have many or no transactions, as when it is created, payment will not have been processed and may fail. This also allows for the ability to refund and list it as such on the same order.

* Address
    Belongs to:
      *  User

An address is simply created when a user chooses to input it into the system. It belongs to a user and will be mandatory to input before a blend can be created. 

*  Review
    Belongs to:
      *  User
      *  Blend

A review is a small description and rating of a blend that is submitted by a user. As such it belongs to one user and also to one blend.

*  Attribute
    Has many or none
      *  Blends, through Blends Attributes

An attribute is part of categorising blends and making them easier to search. Using a join table, an attribute "belongs to" many blends.

* Transaction
    Belongs to
      *  Order

A transaction belongs to and order to quantify the amount of money moving in regards to that order. It may only belong to one order.

* Message 
    Belongs to
      *  Conversation

Belongs to one conversation only. A boolean is reponsible for differentiating the users

* Image
    Belongs to
      *  Blend

Belongs to only one blend.
