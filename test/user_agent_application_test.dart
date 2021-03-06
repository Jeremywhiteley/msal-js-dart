@TestOn('browser')

import 'package:msal_js/msal_js.dart';
import 'package:test/test.dart';

void main() {
  test('loginRedirect converts JS errors', () {
    final userAgentApp = UserAgentApplication(Configuration());
    
    // Fails because there's no callback
    expect(() => userAgentApp.loginRedirect(), throwsA(isA<ClientConfigurationException>()));
  });

  test('loginPopup converts JS errors', () {
    final userAgentApp = UserAgentApplication(Configuration());
    
    // Fails because scopes is present but empty
    expect(
      () => userAgentApp.loginPopup(AuthRequest()..scopes = []), 
      throwsA(isA<ClientConfigurationException>())
    );
  });

  test('acquireTokenRedirect converts JS errors', () {
    final userAgentApp = UserAgentApplication(Configuration());

    // Fails because there's no callback
    expect(
      () => userAgentApp.acquireTokenRedirect(AuthRequest()), 
      throwsA(isA<ClientConfigurationException>())
    );
  });

  test('acquireTokenPopup converts JS errors', () {
    final userAgentApp = UserAgentApplication(Configuration());
    
    // Fails because scopes is present but empty
    expect(
      () => userAgentApp.acquireTokenPopup(AuthRequest()..scopes = []), 
      throwsA(isA<ClientConfigurationException>())
    );
  });

  test('getLoginInProgress works', () {
    final userAgentApp = UserAgentApplication(Configuration());

    expect(userAgentApp.getLoginInProgress(), isFalse);
  });

  test('getRedirectUri works', () {
    final userAgentApp = UserAgentApplication(
      Configuration()
        ..auth = (AuthOptions()
          ..redirectUri = () => 'test'
        )
    );

    expect(userAgentApp.getRedirectUri(), equals('test'));
  });

  test('getPostLogoutRedirectUri works', () {
    final userAgentApp = UserAgentApplication(
      Configuration()
        ..auth = (AuthOptions()
          ..postLogoutRedirectUri = () => 'test'
        )
    );

    expect(userAgentApp.getPostLogoutRedirectUri(), equals('test'));
  });
}