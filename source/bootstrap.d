
import hunt;
import app.identity.AdminIdentity;

void main()
{
    auto app = Application.getInstance();
	app.accessManager().addIdentity(new AdminIdentity());
	app.run();
}
