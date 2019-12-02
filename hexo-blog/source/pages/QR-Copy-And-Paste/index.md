---
title: QR Copy and Paste
date: 2019-12-01 15:04:04
tags:
categories:
  - Misc
comments: false
---

<div id="firebaseui-auth-container"></div>
<div id="qr-container"></div>

<script src="https://www.gstatic.com/firebasejs/ui/4.3.0/firebase-ui-auth.js"></script>
<link type="text/css" rel="stylesheet" href="https://www.gstatic.com/firebasejs/ui/4.3.0/firebase-ui-auth.css" />

<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.5.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.5.0/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.5.0/firebase-firestore.js"></script>

<script>
  // Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyA1yIn0botDUnjmZUTyezCpIRVDg2-uriM",
    authDomain: "neoworks-prod.firebaseapp.com",
    databaseURL: "https://neoworks-prod.firebaseio.com",
    projectId: "neoworks-prod",
    storageBucket: "neoworks-prod.appspot.com",
    messagingSenderId: "125393560022",
    appId: "1:125393560022:web:a54330fc212cbccce8c477"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  var db = firebase.firestore();

  // Initialize the FirebaseUI Widget using Firebase.
  var ui = new firebaseui.auth.AuthUI(firebase.auth());

  ui.start('#firebaseui-auth-container', {
    signInOptions: [
      firebase.auth.EmailAuthProvider.PROVIDER_ID
    ],
    credentialHelper: firebaseui.auth.CredentialHelper.NONE,
    callbacks: {
        signInSuccessWithAuthResult(authResult, redirectUrl) {
            var user = authResult.user;
            var credential = authResult.credential;
            var isNewUser = authResult.additionalUserInfo.isNewUser;
            var providerId = authResult.additionalUserInfo.providerId;
            var operationType = authResult.operationType;
            console.log(`App: user => ${user.uid}`)

            db.collection("qr_copy_n_paste").get().then((querySnapshot) => {
                querySnapshot.forEach((doc) => {
                    console.log(`App: ${doc.id} => ${doc.data()}`);
                });
            });

            return false;            
        }
    }
  });
</script>
