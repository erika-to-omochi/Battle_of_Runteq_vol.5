module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  theme: {
    extend: {
      backgroundImage: theme => ({
        'top.jpg': "url('../img/top.jpg')",
       })
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
}
