module app.system.model.UserRole;

import entity;

@Table("system_user_role")
class UserRole
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    int user_id;

    int role_id;

}
