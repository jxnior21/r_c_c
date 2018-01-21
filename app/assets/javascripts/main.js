function myFunction() {
    let x = document.forms.Adminform.password;
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}
