LOGO

# Tchiba

IMAGE

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
  * Orders shipped/not shipped and payment status (seller/buyer)
  * Historical orders (seller/buyer)
  * Receipts (seller/buyer)
  * Credit (seller)
* Admin page for moderation of content.