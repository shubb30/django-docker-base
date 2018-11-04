node {
    def now = sh(returnStdout: true, script: 'date +%Y%m%d').trim()
    def ver = ""
    def docker_img = "shubb30/django-base"

    stage("Build Container") {
        dir('src_temp') {
            checkout scm
            ver = sh(returnStdout: true, script:  "cat VERSION.txt").trim()
            sh "docker build -t='${docker_img}' ."
        }    
    }
    stage("Push Docker"){
        sh("docker tag ${docker_img} ${docker_img}:${ver}")

        withDockerRegistry([credentialsId: 'dockerhub-2018-04-30']) {
            sh("docker push ${docker_img}:${ver}")
        }
    }
}

