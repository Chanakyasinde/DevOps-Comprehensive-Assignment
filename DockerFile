FROM node:20

WORKDIR /app

COPY backend/package*.json ./backend/
RUN cd backend && npm install

COPY frontend ./frontend
RUN cd frontend && npm install && npm run build

# Move frontend build to backend
RUN cp -r frontend/dist backend/dist

# Copy backend code
COPY backend ./backend

WORKDIR /app/backend

EXPOSE 5000

CMD ["node", "index.js"]
