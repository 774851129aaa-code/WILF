# استخدام نسخة Node.js مستقرة وخفيفة
FROM node:18-alpine

# تثبيت git داخل الحاوية لمساعدة npm على تحميل الاعتماديات المباشرة من GitHub
RUN apk add --no-cache git

# تحديد مجلد العمل داخل الكانتينر
WORKDIR /usr/src/app

# نسخ ملفات تعريف الحزم أولاً
COPY package*.json ./

# تثبيت الحزم والمكتبات
RUN npm install --omit=dev

# نسخ بقية ملفات المشروع
COPY . .

# فتح المنفذ الخارجي لتطبيق Express
EXPOSE 3000

# أمر تشغيل البوت
CMD ["npm", "start"]
