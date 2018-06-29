
import hunt;
import app.auth.AdminIdentity;

void main()
{
    auto app = Application.getInstance();
	app.accessManager().addIdentity(new AdminIdentity());
	app.run();
}
