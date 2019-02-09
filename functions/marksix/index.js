const functions = require('firebase-functions');
const seedrandom = require('seedrandom');
const admin = require('firebase-admin');
//admin.initializeApp(functions.config().firebase);
//admin.initializeApp(process.env.FIREBASE_CONFIG)
admin.initializeApp({
  databaseURL: "https://neoworks-prod.firebaseio.com/",
});
//admin.initializeApp();

// Fisher-Yates (aka Knuth) Shuffle
function shuffle(rng, array) {
  var currentIndex = array.length, temporaryValue, randomIndex;

  // While there remain elements to shuffle...
  while (0 !== currentIndex) {

    // Pick a remaining element...
    randomIndex = Math.floor(rng() * currentIndex);
    currentIndex -= 1;

    // And swap it with the current element.
    temporaryValue = array[currentIndex];
    array[currentIndex] = array[randomIndex];
    array[randomIndex] = temporaryValue;
  }

  return array;
}

// create an array filled with integers wiht range
function range(start, stop) {
    var arr = [];
    while (start <= stop) {
        arr.push(start++);
    }
    return arr;
}

exports.marksix = (req, res) => {
  // time as seed
  var seed = new Date().getTime();
  // Autoseeded ARC4-based PRNG.
  var rng = seedrandom(seed);
  
  
  // take the first 6
  var arr = { 
    "lucky_numbers" : shuffle(rng, range(1, 49)).slice(0, 6),
    "seed" : seed,
    "random_generator" : "Seeded ARC4-based PRNG"
  };
 
  admin.database().ref('user_draws').push().set(arr, function(error) {
    if (error) {
      alert(error);
    } else {
      res.send(arr);
    }
  });
};
