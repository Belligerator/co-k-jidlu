String? emailValidator(String? value) {
  var regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (value == null || value.isEmpty) {
    return 'Zadejte e-mail';
  } else if (!regExp.hasMatch(value)) {
    return 'Zadejte platnou e-mailovou adresu';
  }
  return null;
}

String? Function(String?) emptyValidator(String message) {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  };
}

String? Function(String?) urlValidator(String message, String message2) {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return message;
    }
    if (value.toLowerCase() == 'test') {
      return null;
    }
    var urlPattern = r"(https?|http)://([-A-Z0-9:]+)([-A-Z0-9.:]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:,.;]*)?";
    var match = RegExp(urlPattern, caseSensitive: false).stringMatch(value);
    if (match != value) {
      return message2;
    }
    return null;
  };
}

String? newPasswordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Zadejte heslo';
  } else if (value.length < 6) {
    return 'Heslo musí obsahovat minimálně 6 znaků';
  }
  return null;
}

String? newPasswordCheckValidator(String? password, String? passwordCheck) {
  if (passwordCheck == null || passwordCheck.isEmpty) {
    return 'Zadejte heslo pro kontrolu';
  } else if (password != passwordCheck) {
    return 'Hesla se neshodují';
  }
  return null;
}
