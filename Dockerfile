# استخدام نسخة Node.js مستقرة وخفيفة
FROM node:18-alpine

# تحديد مجلد العمل داخل الكانتينر
WORKDIR /usr/src/app

# نسخ ملفات تعريف الحزم أولاً لتسريع عملية الـ Build
COPY package*.json ./

# تثبيت الحزم والمكتبات
RUN npm install --production

# نسخ بقية ملفات المشروع
COPY . .

# فتح المنفذ الخارجي لتطبيق Express
EXPOSE 3000

# أمر تشغيل البوت
CMD ["npm", "start"]
