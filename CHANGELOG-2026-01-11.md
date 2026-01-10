# سجل التعديلات - 11 يناير 2026

## ملخص
تم إصلاح أخطاء برمجية حرجة في عدة Controllers وإضافة نظام إدارة المستخدمين الكامل.

---

## 📋 قائمة التعديلات

| # | الميزة | الحالة |
|---|--------|--------|
| 1 | إصلاح HistoricalEventController | ✅ تم |
| 2 | إصلاح PhotographController + فلترة الحالة | ✅ تم |
| 3 | إصلاح AchievementController (مشكلة التفويض) | ✅ تم |
| 4 | إصلاح NodeController (أمان + تفويض) | ✅ تم |
| 5 | بناء نظام إدارة المستخدمين الكامل | ✅ تم |

---

## 📁 الملفات المعدّلة

### 1. HistoricalEventController.php
**المسار:** `app/Http/Controllers/HistoricalEventController.php`

#### ❌ المشكلة:
كان الكود يستخدم `$this->donationService` وهو service غير موجود في هذا الـ Controller، مما يسبب خطأ عند تعديل أو حذف الأحداث التاريخية.

#### ✅ الحل:
تم تغيير `$this->donationService` إلى `$this->historicalEventService` في:

| Method | السطر | قبل | بعد |
|--------|-------|-----|-----|
| `update()` | 76 | `$this->donationService->find($id)` | `$this->historicalEventService->find($id)` |
| `destroy()` | 85 | `$this->donationService->find($id)` | `$this->historicalEventService->find($id)` |

---

### 2. PhotographController.php
**المسار:** `app/Http/Controllers/PhotographController.php`

#### ❌ المشكلة 1 - نفس الخطأ:
كان الكود يستخدم `$this->donationService` بدلاً من `$this->photographService`.

#### ✅ الحل:
تم تغيير `$this->donationService` إلى `$this->photographService` في:

| Method | السطر | قبل | بعد |
|--------|-------|-----|-----|
| `update()` | 88 | `$this->donationService->find($id)` | `$this->photographService->find($id)` |
| `destroy()` | 100 | `$this->donationService->find($id)` | `$this->photographService->find($id)` |

---

#### ❌ المشكلة 2 - الألبومات لا تظهر على الموقع:
الـ API كان يُرجع جميع الألبومات بغض النظر عن حالتها (WAITING, APPROVED, REJECTED).

#### ✅ الحل:
```php
use App\Enums\Photograph\PhotographStatus;

// في index() method:
if (!auth()->check()) {
    $query->where('status', PhotographStatus::APPROVED->value);
}
```

**النتيجة:** الزوار غير المسجلين يرون فقط الألبومات المعتمدة (APPROVED).

---

### 3. AchievementController.php
**المسار:** `app/Http/Controllers/AchievementController.php`

#### ❌ المشكلة:
الـ `show()` method كان يتطلب تفويض رغم أنه مستثنى من الـ auth middleware، مما يمنع الزوار من عرض الإنجازات.

#### ✅ الحل:
```php
// قبل
$this->authorize('view', $achievement);

// بعد
// Allow public access - no authorization needed for viewing
```

---

### 4. HistoricalEventController.php (تعديل إضافي)
**المسار:** `app/Http/Controllers/HistoricalEventController.php`

#### ❌ نفس مشكلة التفويض في `show()`:

#### ✅ الحل:
إزالة `$this->authorize('view', $historicalEvent)` من `show()` method.

---

### 5. PhotographController.php (تعديل إضافي)
**المسار:** `app/Http/Controllers/PhotographController.php`

#### ❌ نفس مشكلة التفويض في `show()`:

#### ✅ الحل:
إزالة `$this->authorize('view', $photograph)` من `show()` method.

---

### 6. NodeController.php
**المسار:** `app/Http/Controllers/NodeController.php`

#### ❌ المشكلة 1 - ثغرة أمنية:
الـ `destroy()` method لم يكن يتحقق من الصلاحيات، أي مستخدم مسجل يمكنه حذف أي عقدة!

#### ✅ الحل:
```php
// قبل
public function destroy(mixed $id)
{
    $this->nodeService->delete($id);
    return response()->noContent();
}

// بعد
public function destroy(mixed $id)
{
    $node = $this->nodeService->find($id);
    $this->authorize('delete', $node);
    $this->nodeService->delete($id);
    return response()->noContent();
}
```

---

#### ❌ المشكلة 2 - `getChildrenOfNode()`:
كان يتطلب تفويض رغم أنه مستثنى من auth.

#### ✅ الحل:
إزالة `$this->authorize('viewAny', Node::class)` من الـ method.

---

## 📁 الملفات المُضافة (نظام إدارة المستخدمين)

### 7. UserController.php (إعادة بناء كاملة)
**المسار:** `app/Http/Controllers/UserController.php`

تم إعادة بناء الـ Controller بالكامل ليشمل:
- `index()` - عرض جميع المستخدمين
- `store()` - إضافة مستخدم جديد
- `show()` - عرض مستخدم واحد
- `update()` - تعديل مستخدم
- `destroy()` - حذف مستخدم
- دعم تعيين الأدوار (Roles)

---

### 8. UserPolicy.php (جديد)
**المسار:** `app/Policies/UserPolicy.php`

سياسة الصلاحيات للمستخدمين:
- `viewAny` - عرض جميع المستخدمين
- `view` - عرض مستخدم (يمكن للمستخدم عرض نفسه)
- `create` - إنشاء مستخدم
- `update` - تعديل مستخدم (يمكن للمستخدم تعديل نفسه)
- `delete` - حذف مستخدم (لا يمكن للمستخدم حذف نفسه)

---

### 9. UserFilter.php (جديد)
**المسار:** `app/Filters/UserFilter.php`

فلتر للبحث والترتيب:
- البحث بـ: `fullName`, `mobile`, `email`
- الفلترة بـ: `status`

---

### 10. UserRequest.php (جديد)
**المسار:** `app/Http/Requests/User/UserRequest.php`

طلب التحقق من البيانات:
- `fullName` - مطلوب
- `mobile` - مطلوب، فريد
- `email` - اختياري، فريد
- `password` - مطلوب عند الإنشاء
- `roles` - اختياري، مصفوفة IDs

---

### 11. UserList.php (جديد)
**المسار:** `app/Http/Resources/User/UserList.php`

Resource لعرض قائمة المستخدمين.

---

### 12. PermissionName.php (تعديل)
**المسار:** `app/Enums/Permission/PermissionName.php`

إضافة صلاحيات إدارة المستخدمين:
```php
case CAN_CREATE_USERS = 'can_create_users';
case CAN_VIEW_ALL_USERS = 'can_view_all_users';
case CAN_VIEW_USERS = 'can_view_users';
case CAN_UPDATE_USERS = 'can_update_users';
case CAN_DELETE_USERS = 'can_delete_users';
```

---

### 13. api.php (تعديل)
**المسار:** `routes/api.php`

إضافة routes لإدارة المستخدمين:
```php
use App\Http\Controllers\UserController;

Route::apiResource('users', UserController::class);
```

---

## 🧪 خطوات الاختبار

### الأحداث التاريخية:
- `PUT /api/historical_event/{id}` ✅
- `DELETE /api/historical_event/{id}` ✅

### الألبومات:
- `PUT /api/photograph/{id}` ✅
- `DELETE /api/photograph/{id}` ✅
- `GET /api/photograph` (بدون token) - يظهر APPROVED فقط ✅

### الإنجازات:
- `GET /api/achievement/{id}` (بدون token) - يعمل للزوار ✅

### العقد:
- `DELETE /api/nodes/{id}` - يتطلب صلاحية ✅
- `GET /api/nodes/{id}/children` (بدون token) - يعمل للزوار ✅

### المستخدمين:
- `GET /api/users` - عرض الكل ✅
- `POST /api/users` - إضافة ✅
- `GET /api/users/{id}` - عرض واحد ✅
- `PUT /api/users/{id}` - تعديل ✅
- `DELETE /api/users/{id}` - حذف ✅

---

## 📌 ملاحظات مهمة

1. **تأكد من تشغيل الـ Seeder** لإضافة الصلاحيات الجديدة للمستخدمين.

2. **تسجيل الـ Policy**: أضف في `AuthServiceProvider`:
```php
protected $policies = [
    User::class => UserPolicy::class,
];
```

3. **تأكد من وجود ألبومات بحالة APPROVED** في قاعدة البيانات لتظهر على الموقع.

---

## 🌐 تعديلات Frontend

### tree_website (موقع الويب)

#### 1. إضافة حقول كلمة السر لنموذج طلب الانضمام

**الملفات المعدّلة:**
- `tree_website/src/types/auth/request.ts` - إضافة `password` و `password_confirmation`
- `tree_website/src/pages/Auth/FirstOrder.tsx` - إضافة حقول الإدخال

**التغييرات:**
```typescript
// في JoinFormData
password: string;
password_confirmation: string;
```

```tsx
// في الفورم - حقول جديدة
<InputBlock label="كلمة السر">
  <Input type="password" name="password" ... />
</InputBlock>
<InputBlock label="تأكيد كلمة السر">
  <Input type="password" name="password_confirmation" ... />
</InputBlock>
```

---

### family_tree_dashboard (لوحة التحكم)

#### 1. إصلاح نوع Photograph لإظهار الحالة

**الملف:** `family_tree_dashboard/src/types/photograph/response.ts`

**التغيير:**
```typescript
export interface IPhotograph extends IBaseModel {
  // ... existing fields
  status?: number;  // ← أُضيف
};
```

---

## 📊 حالة الميزات النهائية

| الميزة | Backend | Dashboard | Website |
|--------|---------|-----------|---------|
| الإنجازات | ✅ | ✅ | ✅ |
| الأحداث التاريخية | ✅ | ✅ | ✅ |
| الألبومات | ✅ | ✅ | ✅ |
| أحداث اللجان | ✅ | ✅ | ✅ |
| إدارة المستخدمين | ✅ | ⚠️ (يستخدم Members) | - |
| التبرعات | ✅ | ✅ | ✅ |
| طلبات الانضمام | ✅ | ✅ | ✅ (+ كلمة السر) |
| العقد | ✅ | ✅ | ✅ |
