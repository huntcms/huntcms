module app.component.system.model.RolePermission;

import entity;

@Table("system_role_permission")
class RolePermission
{
    mixin MakeEntity;

    @AutoIncrement
    @PrimaryKey
    int id;

    int role_id;

    string permission_id;
  
}
