
### Warning ( I have disabled Google Cloud Console so some features of the application like ( image loading will not work ) but the code is there :)

#### >>>>>>>----------------------- CURRENTLY UNDER DEVELOPMENT-------------------<<<<<<<<<<

Hello :slightly_smiling_face: this is the link of the E-Commerce website i made , it needs a little bit more work but is almost ready . It is also mobile friendly . https://dopeshop.herokuapp.com/ 

I have added some accounts just for checking , so to log in as admin -> ```admin@dopeshop.com``` and ```123123``` , 
to log in as ordinary user -> ```noadmin@dopeshop.com``` and ```123123```

Of course you can create as many ordinary users as you want


# View the website on Heroku

-> https://dopeshop.herokuapp.com/


## Features
- **App**
  - User Authentication using  (BCrypt gem)
  - ADMIN and User roles 
  - Products icons saved on Google Cloud or Amazon Cloud
  - Email Account Activation
  - Users can follow other users
  - Twitter like feed mechenism for followers
  - Beautiful Search Bars
  - Beautiful Paginations
  - Users can post articles
  - Proceed products to cart
  - Make Orders
  - Edit , destroy orders (Admin)
- _**Working on it**_
  - - Implement State Machine
  - - Use more Ajax requests
  - - Implementing tickets
  - - Implementing shipping

Images from version V1.0


| Home  | Users
|:-:|:-:|
| ![First](https://user-images.githubusercontent.com/20374208/40195917-99eec18c-5a17-11e8-9091-75719a991c32.png) | ![Sec](https://user-images.githubusercontent.com/20374208/40195918-9a10a7e8-5a17-11e8-8261-ac945dcba10e.png) |

| Orders  | Articles
|:-:|:-:|
| ![First](https://user-images.githubusercontent.com/20374208/34919204-13275106-f968-11e7-9ba3-316eb500e202.png) | ![Sec](https://user-images.githubusercontent.com/20374208/34919221-680184e4-f968-11e7-9878-0a3dd9f3f501.png) |

Cart
![cart](https://user-images.githubusercontent.com/20374208/40195915-99a80788-5a17-11e8-8a4c-df5a85d829a4.png)

---

# Special Thanks on 

[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly: THE TESTS FAIL (Because i didn't corrected them all loool! )

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

For more information, see the
[*Ruby on Rails Tutorial* book](http://www.railstutorial.org/book).
