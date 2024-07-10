public class PasswordValidator {

    public static boolean isValidPassword(String password) {
        if (password == null || password.length() < 8)
