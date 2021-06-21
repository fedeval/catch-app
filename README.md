# Catch App #

## Introduction ##

This app is the brainchild of [@juan-runs-code](https://github.com/juan-runs-code) and our final project of the [LeWagon](https://www.lewagon.com/) 24-week Part-time Fullstack Web Development bootcamp. As the world went into lockdown in 2020 because of COVID-19, remote work became the norm for millions of knowledge workers. While a lot of benefits came with the opportunity to work from anywhere, all the spontaneous and serendipitous brief interactions between co-workers suddenly went away as we got stuck into a daily grind of Zoom/Meet/Teams/put-your-videoconferencing-tool-name-here meetings. We built Catch App with the goal of creating a way for co-workers to connect randomly and/or intentionally with colleagues keen to have informal interactions and get to know each other despite been stuck at home. 

The app offers functionality including:
* Selecting timeslots for informal meetings within a 2 hour time window at 10 min. intervals
* Book instantly slots at which times other colleagues have made themselves available (anonimous matching)
* Join a video call at the selected time (powered by the Vonage Video API)
* Add co-workers as contacts and reward them for pleasant and fun interactions through a badge system
* Real-time text chat with existing contacts

It’s hardly perfect (time zones be damned!!), but is the product of a month of hard work and late nights from a team of 4 people that until 5 months prior barely knew how to write a "Hello, world!" program. If you are curious to explore the app yourself and look at our work, below are some instructions on how to set things up on your machine.

---
## System Dependencies ##

The app is meant to work with the following requirements:
```
- Ruby v2.6.6p146 (2020-03-31 revision 67876) [x86_64-darwin19]
- Rails v6.0.3.4
- Node v.16.3.0
- Postgres v.13.3
```
---
## Setup ##

### Environment variables ###

The app relies on a few environment variables to function. `dotenv` is already included in the `package.json`file, so it is only necessary to create a `.env` file - which by default will be ignored by git as already added to a `.gitignore` file - with the following variables :

| Name              | Notes                                                                | Function          |
| ------------------|:--------------------------------------------------------------------:| :----------------:|
| CLOUDINARY_URL    | Create a Cloudinary account at [https://cloudinary.com/]             | Image hosting     |
| VONAGE_API_KEY    | Get free API credentials at [https://tokbox.com/account/user/signup] | Videoconferencing |
| VONAGE_API_SECRET | Get free API credentials at [https://tokbox.com/account/user/signup] | Videoconferencing |

### Gems and dependencies ###

After cloning the repo using `git clone git@github.com:fedeval/catch-app.git`, `cd` into the folder and install all the project gems and dependencies using bundler and yarn. Run:

```
bundle install
yarn install
````

### Database ###

To create the postgres db and run all migrations use the command:
```
rails db:create db:migrate
```

The folder includes a seed file that creates a few test users and adds a few booking slots ready to be confirmed. If you wish to use these seeds just run `rails db:seed` after you have created the db and run all migrations.

---
### How to use ###

Once you have completed the setup, just run `rails server` or `rails s` in your terminal from the root folder. The app will then be available on [http://localhost:3000/](http://localhost:3000/).

