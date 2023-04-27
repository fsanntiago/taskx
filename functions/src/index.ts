import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();
// const db = admin.firestore();

// export const onCreateUser = functions.auth.user().onCreate(user => {
//   db.collection("users").doc(user.uid).set({'plan'=})
// })
//   .document("users")
//   .onWrite((change, context) => {
//     const user = context.auth?.uid;
//     console.log(user);
//   });

export const helloWorld = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", { structuredData: true });
  response.send("Hello from Firebase!");
});

export const onCreateCategory = functions.https.onCall((data, context) => {
  const user = context.auth?.uid;
  var isInCategoriesLimit;

  functions.firestore.document(`users/${user}`).onWrite((change, context) => {
    const oldValue = change.before.exists ? change.before.data() : null;
    // const newValue = change.after.exists ? change.after.data() : null;

    if (oldValue != null && oldValue.totalCategories >= 5) {
      isInCategoriesLimit = true;
      return;
    }

    // var cateroryRef = db.doc(`users/${user}`).collection('categories')
  });
  if (isInCategoriesLimit === true) {
    return;
  }
});
