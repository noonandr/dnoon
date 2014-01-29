module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    
    connect:
        server:
          options:
            port: 3000,
            base: './build/'
    
    sass:
      dist:
        options:
          style: "expanded"
          compass: "true"
        files:
          "build/application.css": ["app/sass/style.scss"]
          
    coffee:
      compile:
        files:
          'build/application.js': ['app/coffee/*.coffee']
          
    slim:
      dist:
        options:
          pretty: true
        files:
          'build/index.html': 'app/slim/index.slim'
          'build/web.html': 'app/slim/web.slim'
          'build/projects.html': 'app/slim/projects.slim'
      
    favicons:
      options:
        trueColor: true,
        precomposed: true,
        appleTouchBackgroundColor: "#fff",
        coast: true,
        windowsTile: true,
        tileBlackWhite: false,
        tileColor: "auto",
        html: 'slim/header.html',
        HTMLPrefix: "/images/icons/"
      icons:
        src: 'app/favicon/logo.png'
        dest: 'build/images/icons/'

    watch:
      options:
            livereload: true
      css:
        files: "**/*.scss"
        tasks: ["sass"]
      coffee:
        files: "**/*.coffee"
        tasks: ["coffee"]
      slim:
        files: ["**/*.slim", "**/*.html"]
        tasks: ["slim"]
      favicons:
        files: "app/favicon/logo.png"
        tasks: ["favicons"]

  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-slim"
  grunt.loadNpmTasks "grunt-favicons"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.registerTask "default", [ "connect", "watch"]