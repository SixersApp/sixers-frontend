/*
Use the following code to retrieve configured secrets from SSM:

const { SSMClient, GetParametersCommand } = require('@aws-sdk/client-ssm');

const client = new SSMClient();
const { Parameters } = await client.send(new GetParametersCommand({
  Names: ["RDS_HOST","RDS_PORT","RDS_USER","RDS_DATABASE","RDS_PASSWORD"].map(secretName => process.env[secretName]),
  WithDecryption: true,
}));

Parameters will be of the form { Name: 'secretName', Value: 'secretValue', ... }[]
*/
/*
Use the following code to retrieve configured secrets from SSM:


Parameters will be of the form { Name: 'secretName', Value: 'secretValue', ... }[]
*/
/*
Copyright 2017 - 2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance with the License. A copy of the License is located at
    http://aws.amazon.com/apache2.0/
    or in the "license" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
*/


/* Amplify Params - DO NOT EDIT
AUTH_SIXERSSCORING893E2197_USERPOOLID
ENV
REGION
Amplify Params - DO NOT EDIT */

// const { SSMClient, GetParametersCommand } = require('@aws-sdk/client-ssm');
const express = require('express');
const { json } = require('body-parser');
const { eventContext } = require('aws-serverless-express/middleware');
const fs = require("fs");
const path = require("path");
const pg = require('pg');

const caCertPath = path.resolve(__dirname, 'global-bundle.pem');

const caCert = fs.readFileSync(caCertPath);

const dbConfig = {
  host: process.env.PGHOST,
  port: process.env.PGPORT,
  database: process.env.PGDATABASE,
  user: process.env.PGUSER,
  password: process.env.PGPASSWORD,
  ssl: {
    rejectUnauthorized: true,
    ca: caCert
  }
};

const getDbClient = () => {
  return new pg.Client(dbConfig);
}

// declare a new express app
// const client = new SSMClient();
const app = express()
app.use(json())
app.use(eventContext())

// Enable CORS for all methods
app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*")
  res.header("Access-Control-Allow-Headers", "*")
  next()
});


/**********************
 * Example get method *
**********************/

// const getDbSecrets = async () => {
//   const { Parameters } = await client.send(new GetParametersCommand({
//     Names: ["RDS_HOST","RDS_PORT","RDS_USER","RDS_DATABASE","RDS_PASSWORD"].map(secretName => process.env[secretName]),
//     WithDecryption: true,
//   }));

//   return Parameters;

// }
app.get('/tournaments/:tournamentId', async function (req, res) {
  // Add your code here
  const client = getDbClient();

  try {

    const claims = req.apiGateway.event.requestContext.authorizer.claims;
    const requestedId = req.params.tournamentId;
    const userTournamentId = claims["custom:tournamentId"];

    if (userTournamentId !== requestedId) {
      return res.status(403).json({ message: 'Forbidden Access' });
    }

    await client.connect();
    const queryText = `SELECT * FROM public.tournament_info WHERE id = $1`;
    const dbResponse = await client.query(queryText, [requestedId]);

    res.json(dbResponse.rows[0] || { message: 'Not found' });

  } catch (e) {
    console.log("Error occured:", e);
  } finally {
    if (client) {
      await client.end();
    }
  }

});

app.get('/tournaments/:tournamentId/*', function (req, res) {
  // Add your code here
  res.json({ success: 'get call succeed!', url: req.url });
});

/****************************
* Example post method *
****************************/

app.post('/tournaments/:tournamentId', function (req, res) {
  // Add your code here
  res.json({ success: 'post call succeed!', url: req.url, body: req.body })
});

app.post('/tournaments/:tournamentId/*', function (req, res) {
  // Add your code here
  res.json({ success: 'post call succeed!', url: req.url, body: req.body })
});

/****************************
* Example put method *
****************************/

app.put('/tournaments/:tournamentId', function (req, res) {
  // Add your code here
  res.json({ success: 'put call succeed!', url: req.url, body: req.body })
});

app.put('/tournaments/:tournamentId/*', function (req, res) {
  // Add your code here
  res.json({ success: 'put call succeed!', url: req.url, body: req.body })
});

/****************************
* Example delete method *
****************************/

app.delete('/tournaments/:tournamentId', function (req, res) {
  // Add your code here
  res.json({ success: 'delete call succeed!', url: req.url });
});

app.delete('/tournaments/:tournamentId/*', function (req, res) {
  // Add your code here
  res.json({ success: 'delete call succeed!', url: req.url });
});

app.listen(3000, function () {
  console.log("App started")
});

// Export the app object. When executing the application local this does nothing. However,
// to port it to AWS Lambda we will create a wrapper around that will load the app from
// this file
module.exports = app;
