pipeline {
    agent any
    stages {
        stage ('Test') {
            agent {
                dockerfile { filename 'dockerfile' 
                             args '--net final_nginx-net'
                           }
            }
            steps {
                sh '''
                    make lint && make test
                    if [ $? -ne 0 ];
                        then
                            echo "Test error"
                            exit 1
                    fi
                export GOPATH=$WORKSPACE/go
                export PATH="$PATH:$(go env GOPATH)/bin"               
                go get github.com/tools/godep
                go get github.com/smartystreets/goconvey
                go get github.com/GeertJohan/go.rice/rice  
                go get github.com/wickett/word-cloud-generator/wordyapi
                go get github.com/gorilla/mux
                sed -i "s/1.DEVELOPMENT/1.$BUILD_NUMBER/g" static/version
                GOOS=linux GOARCH=amd64 go build -o ./artifacts/word-cloud-generator -v 
                md5sum artifacts/word-cloud-generator
                ls -l artifacts/
                gzip -f ./artifacts/word-cloud-generator
                '''
            }
        }
        
        stage ('Upload to nexus') {
            steps {
                nexusArtifactUploader (artifacts: [[artifactId: 'word-cloud-generator', 
                classifier: '', file: 'artifacts/word-cloud-generator.gz', 
                type: 'gz']], credentialsId: 'uploader', groupId: "$git_branch", 
                nexusUrl: 'nexus:8081', nexusVersion: 'nexus3', protocol: 'http', 
                repository: 'word-cloud-build', version: '1.$BUILD_NUMBER')
            }
        }
        stage('Testing') {
            agent {
                dockerfile { filename 'alpine/alpinedockerfile' 
                             args '-d --net final_nginx-net -p 8888:8888'
                           }
            }
            steps {
                sh '''
                 curl -u downloader:123 -X GET "http://nexus:8081/repository/word-cloud-build/$git_branch/word-cloud-generator/1.$BUILD_NUMBER/word-cloud-generator-1.$BUILD_NUMBER.gz" -o /opt/wordcloud/word-cloud-generator.gz
                 gunzip -f /opt/wordcloud/word-cloud-generator.gz
                 chmod +x /opt/wordcloud/word-cloud-generator
                 /opt/wordcloud/word-cloud-generator &
                 sleep 60
                '''
            }
        }
    }
}
