## Objective
The objective of this lesson is to install the [Jenkins](https://www.jenkins.io/) into the Katacoda interactive learning environment.

Jenkins is a well known open source platform for continuous integration and continuous delivery ([CI/CD](https://en.wikipedia.org/wiki/CI/CD)) activity. As mentioned previously, we'll use Jenkins to work with a script stored in the common GitHub code repository to automatically do the Build and Release stages of Build, Release, Run.

## Steps

**Step 1:** Confirm you're in the lesson's working directory.

`cd /root/12factor && pwd`{{execute}}

You should see the following output:

`/root/12factor`

We're now ready to install Jenkins. As mentioned earlier, we're going to run Jenkins in a Docker container created especially for this scenario.

**Step 2:** Go back to the `HOME` directory

`cd ~/`{{execute}}

**Step 3:** Get the special Jenkins Docker code from GitHub

`git clone https://github.com/reselbob/fatjenkins.git`{{execute}}

**Step 4:** Go the Jenkin's source code working directory

`cd fatjenkins`{{execute}}

**Step 5:** Build the Docker image for Jenkins

`docker build -t fatjenkins:v1 .`{{execute}}

**Step 6:** Create the Jenkins container from the Docker image

`docker run --name jenkins --network="host" -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker fatjenkins:v1`{{execute}}

**Step 7:**  Get the initial login ID that you'll need to access Jenkins

`docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword`{{execute}}

**BEWARE:!!!** Sometimes it takes the Jenkins container to spin up. You might have to try **Step 7** more than once.

You will see output similar, but not the same as the following:

`134dbef47a2540a791c08b0af7575e30`

**Make sure you save the output.** You are going to need that output to get into Jenkins the first time you access the website.

Jenkins is now up and running. You can access it by clicking this URL:

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com

When you go to the URL you'll be asked to enter the ID value you generated in **Step 7**. Once you get into the Jenkin website, follow the instructions to complete the Jenkins setup process. The following video will walk you through the process. **REMEMBER!!!! Make sure the token string outputted at the beginning of this step is on hand to copy into the Jenkins UI.**

**Step 8:** Watch the following short video to see the details for initializing Jenkins:

<iframe width="560" height="315" src="https://www.youtube.com/embed/D0TRbUNgcV4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Hint:** Jenkins will ask you which plugins you want to install during the intialization process. Select the option, **INSTALL SUGGESTED PLUGINS**.

## Summary

In this lesson you got Jenkins up and running as a Docker container. In the next lesson we're going to create two Jenkins Pipeline jobs. Each job will run a `Jenkinsfile` script that's stored in the GitHub repository that correlates to the two versions of *Secret Society* that we're going to release according to the 12 Factor App principle of [Dev/Prod Parity](https://12factor.net/dev-prod-parity). Each `Jenkinsfile` script contains the instructions to clone the source code for the relevant version of the demonstration application, *Secret Society*. Also, the script will build that code into a container image. The image is then stored in the Local Container Registry according to a tag for the particular version. (The Local Container Registry was installed behind the scenes in the Katacoda interactive learning environment at the start of the scenario.

----


**Next: Preparing for the Pipeline Scripts for Multiple Releases**