
import hunt;
import app.auth.AdminIdentity;

void main()
{
    auto app = Application.getInstance();
	//app.getAccessManager().addIdentity(new AdminIdentity());
	app.run();
}
