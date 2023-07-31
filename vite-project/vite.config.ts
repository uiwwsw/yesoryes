import { fileURLToPath, URL } from "node:url"
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'

export default defineConfig({
  resolve: {
    alias: {
      "@": fileURLToPath(new URL("./src/components", import.meta.url)),
      "#": fileURLToPath(new URL("./src/utils", import.meta.url))
    }
  },
  base: "/",
  plugins: [react()],
})
