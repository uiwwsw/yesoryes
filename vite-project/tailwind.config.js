/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      'white': '#ffffff',
      'purple': '#3f3cbb',
      'midnight': '#121063',
      'metal': '#565584',
      'tahiti': '#3ab7bf',
      'silver': '#ecebff',
      'bubble-gum': '#ff77e9',
      'bermuda': '#78dcca',
    },
    extend: {
      keyframes: {
        'dialog-close': {
          '0%': { opacity: '1', transform: 'scale(1)' },
          '20%': { opacity: '1', transform: 'scale(1.08)' },
          '100%': { opacity: '0', transform: 'scale(0.5)' },
        },
        'dialog-open': {
          '0%': { opacity: '0', transform: 'scale(0.5)' },
          '80%': { opacity: '1', transform: 'scale(1.08)' },
          '100%': { opacity: '1', transform: 'scale(1)' },
        },
      
      },
      animation: {
        'dialog-close': 'dialog-close 0.4s forwards',
        'dialog-open': 'dialog-open 0.4s',
      },
    }
  },
  plugins: [],
}

