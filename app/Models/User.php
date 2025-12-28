<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Enums\Permission\RoleName;
use App\Enums\User\UserStatus;
use App\Models\Base\BaseModel;
use DateTimeInterface;
use Illuminate\Auth\Authenticatable;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\Access\Authorizable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Laravel\Sanctum\HasApiTokens;
use Laravel\Sanctum\NewAccessToken;
use Spatie\Permission\Traits\HasPermissions;
use Spatie\Permission\Traits\HasRoles;


class User extends BaseModel implements
    AuthenticatableContract,
    AuthorizableContract
{
    use Authenticatable, Authorizable, CanResetPassword;

    use HasApiTokens, HasFactory, Notifiable, HasRoles, SoftDeletes;

    protected $fillable = [
        'full_name',
        'mobile',
        'email',
        'password',
        'status',
        'fcm_token',
        'image_id',
        'attachment_id'
    ];


    protected $hidden = [
        'password',
    ];

    protected $casts = [
        'create_at' => 'datetime',
        'update_at' => 'datetime',
        'deleted_at' => 'datetime',
        'status' => UserStatus::class,
    ];

    public function createToken(string $name, $type, array $abilities = ['*'], DateTimeInterface $expiresAt = null)
    {

        $plainTextToken = sprintf(
            '%s%s%s',
            config('sanctum.token_prefix', ''),
            $tokenEntropy = Str::random(40),
            hash('crc32b', $tokenEntropy)
        );

        $token = $this->tokens()->create([
            'name' => $name,
            'token' => hash('sha256', $plainTextToken),
            'abilities' => $abilities,
            'expires_at' => $expiresAt,
            'type' => $type,
        ]);

        return new NewAccessToken($token, $token->getKey() . '|' . $plainTextToken);
    }

    public function password(): Attribute
    {
        return Attribute::make(
            set: function ($value) {
                return Hash::make($value);
            },
        );
    }

    protected function mobile(): Attribute
    {
        return Attribute::make(
            get: fn(string $value) => '963' . $value,
        );
    }

    public function isAdmin(): bool
    {
        return $this->hasRole(RoleName::ADMIN->value);
    }

    public function member(): HasOne
    {
        return $this->hasOne(Member::class);
    }

    public function image(): BelongsTo
    {
        return $this->belongsTo(Medium::class, 'image_id');
    }
    public function attachment(): BelongsTo
    {
        return $this->belongsTo(Medium::class, 'attachment_id');
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by')->withTrashed();
    }

    public function updatedBy()
    {
        return $this->belongsTo(User::class, 'updated_by')->withTrashed();
    }

    public function deletedBy()
    {
        return $this->belongsTo(User::class, 'deleted_by')->withTrashed();
    }
}
