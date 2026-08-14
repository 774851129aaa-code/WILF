# استخدام نسخة Node.js 20 المستقرة والخفيفة
FROM node:20-alpine

# تثبيت git لتجنب مشاكل سحب المكتبات من GitHub
RUN apk add --no-cache git

# تحديد مجلد العمل داخل الحاوية
WORKDIR /usr/src/app

# نسخ ملفات تعريف الحزم
COPY package*.json ./

# تثبيت حزم الإنتاج فقط
RUN npm install --omit=dev

# نسخ باقي ملفات المشروع
COPY . .

# فتح المنفذ الخارجي
EXPOSE 3000

# أمر التشغيل
CMD ["npm", "start"]
