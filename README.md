

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
  - Beautiful Search Bars
  - Products Pagination 
  - Users Pagination
  - Users can post articles
  - Proceed products to cart
  - Make Orders
  - Edit , destroy orders (Admin)
- _**Working on it**_
  - - Users can follow other users and get feed ( under development )

Images from version V1.0


| Home  | Users
|:-:|:-:|
| ![First](https://user-images.githubusercontent.com/20374208/34919202-10741386-f968-11e7-8b2f-ca622ee25b9f.png) | ![Sec](https://user-images.githubusercontent.com/20374208/34919203-122d1678-f968-11e7-9d14-833a4b0ec6d5.png) |

| Orders  | Articles
|:-:|:-:|
| ![First](https://user-images.githubusercontent.com/20374208/34919204-13275106-f968-11e7-9ba3-316eb500e202.png) | ![Sec](https://user-images.githubusercontent.com/20374208/34919221-680184e4-f968-11e7-9878-0a3dd9f3f501.png) |


---

# Ruby on Rails Tutorial sample application

This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

## License

All source code in the [Ruby on Rails Tutorial](http://railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

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
