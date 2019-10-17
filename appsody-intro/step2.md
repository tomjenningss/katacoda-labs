## Creating a new Project with Appsody

Make a directory to contain your project:

`mkdir -p ~/workspace/kabanero-workshop/nodejs`{{execute}}

Enter the directory where you will be working in:

`cd ~/workspace/kabanero-workshop/nodejs`{{execute}}

Create the new project. This project will be using the Node.JS Express framework.

`appsody init kabanero/nodejs-express`{{execute}}

When the build completes, you should see something like:

<pre>
...
[InitScript] [INFO] ------------------------------------------------------------------------
[InitScript] [INFO] BUILD SUCCESS
[InitScript] [INFO] ------------------------------------------------------------------------
[InitScript] [INFO] Total time: 0.800 s
[InitScript] [INFO] Finished at: 2019-09-02T15:52:41+01:00
[InitScript] [INFO] ------------------------------------------------------------------------
Successfully initialized Appsody project
</pre>

### Live coding with Appsody

Let’s start the new application ready to make some edits. Enter the following command:

`appsody run`{{execute}}

The run command for this stack has been set up to run the application with node and use hot code updates to reflect code changes made to the source tree.

After a while you should see output similar to the following:

<pre>

Running development environment...
Pulling docker image dev.local/nodejs-express:SNAPSHOT
Running command: docker pull dev.local/nodejs-express:SNAPSHOT
Error response from daemon: Get https://dev.local/v2/: Service Unavailable
[Warning] Docker image pull failed: exit status 1
Using local cache for image dev.local/nodejs-express:SNAPSHOT
Running docker command: docker run --rm -p 3000:3000 -p 8080:8080 -p 9229:9229 --name node-js-dev -v /Users/nastacio/workspace/kabanero-workshop/nodejs/:/project/user-app -v node-js-deps:/project/user-app/node_modules -v /Users/nastacio/.appsody/appsody-controller:/appsody/appsody-controller -t --entrypoint /appsody/appsody-controller dev.local/nodejs-express:SNAPSHOT --mode=run
[Container] Running APPSODY_PREP command: npm install --prefix user-app
added 170 packages from 578 contributors and audited 295 packages in 3.639s
[Container] found 0 vulnerabilities
[Container]
Running command:  npm start
[Container] Running command:  npm start
[Container] Wait received error on APPSODY_RUN/DEBUG/TEST signal: interrupt
[Container]
[Container] > nodejs-express@0.2.6 start /project
[Container] > node server.js
[Container]
[Container] [Tue Oct  8 15:04:22 2019] com.ibm.diagnostics.healthcenter.loader INFO: Node Application Metrics 5.0.5.201910032155 (Agent Core 4.0.5)
[Container] [Tue Oct  8 15:04:23 2019] com.ibm.diagnostics.healthcenter.mqtt INFO: Connecting to broker localhost:1883
[Container] App started on PORT 3000
[Container] Running command:  npm start
[Container] [Warning] Wait Received error starting process of type APPSODY_RUN/DEBUG/TEST_ON_CHANGE while running command: npm start error received was: signal: interrupt
[Container]
[Container] > nodejs-express@0.2.6 start /project
[Container] > node server.js
[Container]
[Container] [Tue Oct  8 15:04:23 2019] com.ibm.diagnostics.healthcenter.loader INFO: Node Application Metrics 5.0.5.201910032155 (Agent Core 4.0.5)
[Container] [Tue Oct  8 15:04:24 2019] com.ibm.diagnostics.healthcenter.mqtt INFO: Connecting to broker localhost:1883
[Container] App started on PORT 3000

</pre>

Let’s now make a code change. The Node.js Express stack can dynamically update the running application without needing a restart.

First, navigate to the REST application endpoint to confirm that there are no esources available. Open the following link in your browser:


<a href="https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/resource"> http://localhost:3000/resource</a>{{execute}}

You should see an `Not Found` response.

Open up the app.js file:

`/root/workspace/kabanero-workshop/nodejs.app.js`{{open}}

Insert to modify the app.js source file to include the extra "/resource" REST path:

Copy the following block and add it to app.js
<pre>
app.get('/resource', (req, res) => {
  res.send("Resource from Appsody!");
});
</pre>

You should see that upon saving the file the source code change is detected and the application updated:

<pre>
[Container] Running command:  npm start
[Container] [Warning] Wait Received error starting process of type APPSODY_RUN/DEBUG/TEST_ON_CHANGE while running command: npm start error received was: signal: interrupt
[Container]
[Container] > nodejs-express@0.2.6 start /project
[Container] > node server.js
[Container]
[Container] [Tue Oct  8 15:38:53 2019] com.ibm.diagnostics.healthcenter.loader INFO: Node Application Metrics 5.0.5.201910032155 (Agent Core 4.0.5)
[Container] [Tue Oct  8 15:38:53 2019] com.ibm.diagnostics.healthcenter.mqtt INFO: Connecting to broker localhost:1883
[Container] App started on PORT 3000
</pre>

Now if you browse <a href="https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/resource"> http://localhost:3000/resource</a> you should see the message: `Resource from Appsody!` instead of the original Not Found message

Try changing the message in app.js saving and refreshing the page. You’ll see it only takes a few seconds for the change to take effect.

When you’re done, type `Ctrl-C` to end the appsody run.



