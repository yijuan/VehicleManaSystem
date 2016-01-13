import com.surelution.vms.User

class BootStrap {

    def init = { servletContext ->
		def user = new User(username:'admin',enable:true,password:'123456');
		user.save(flush:true)
    }
    def destroy = {
    }
}
