module app.component.system.model.RolePermission;

import hunt.entity;

@Table("system_role_permission")
class RolePermission
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    int role_id;

    int permission_id;
  
}
