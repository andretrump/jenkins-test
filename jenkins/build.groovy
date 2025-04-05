def execute() {
    echo "Building the app..."
    sh "npm ci"
    sh "npm run build"
}

return this
