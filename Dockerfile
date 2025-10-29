# Gunakan base image Node.js versi LTS (Long Term Support)
FROM node:18-alpine

# Tentukan direktori kerja di dalam container
WORKDIR /app

# Salin package.json dan package-lock.json terlebih dahulu
# Ini memanfaatkan cache Docker. Jika file ini tidak berubah,
# Docker tidak akan meng-install ulang dependensi.
COPY package*.json ./

# Install dependensi
RUN npm install

# Salin sisa kode aplikasi Anda
COPY . .

# Build aplikasi Next.js
RUN npm run build

# Expose port yang digunakan Next.js (default 3000)
EXPOSE 3000

# Perintah untuk menjalankan aplikasi saat container dimulai
CMD ["npm", "start"]