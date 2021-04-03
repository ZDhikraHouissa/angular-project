node {

    checkout scm

    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
    
        def latestAngularImage = docker.build("dhikrahouissa/angular-app")
        def angularImage = docker.build("dhikrahouissa/angular-app:${env.BUILD_ID}")
        /* Push the container to the custom Registry */
        angularImage.push()
		latestAngularImage.push()
    }
}