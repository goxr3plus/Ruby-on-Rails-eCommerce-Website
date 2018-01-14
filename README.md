

#### >>>>>>>----------------------- CURRENTLY UNDER DEVELOPMENT-------------------<<<<<<<<<<


# View the website on Heroku

-> https://dopeshop.herokuapp.com/


## Features
- **App**
  - User Authentication using  (BCrypt gem)
  - ADMIN and User roles 
  - Products icons saved on Google Cloud or Amazon Cloud
  - Beautiful Search Bars
  - Products Pagination 
  - Users Pagination
  - Users can post articles
  - Proceed products to cart
  - Make Orders
  - Edit , destroy orders (Admin)
- _**Working on it**_
  - - Users can follow other users and get feed ( under development )



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
