const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    '../design_support/public/*.html',
    '../design_support/app/helpers/**/*.rb',
    '../design_support/app/javascript/**/*.js',
    '../design_support/app/views/**/*.{html.erb,erb,html}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        elegant: 'fantasy',
      },
    },
  },
  theme: {
    extend: {
      colors: {
        cream: '#f5f5f2',
        brown: '#9a8756',
        blue: '#1DA1F2',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('daisyui'),
  ]
}
