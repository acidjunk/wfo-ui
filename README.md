wfo-ui
======

`wfo-ui-formatics` Contains an implementation of the reference app for [orchestrator-ui](https://github.com/workfloworchestrator/orchestrator-ui/)

You can run it as a standalone project, or clone it as asubmodule inside the apps folder of the monorepo.

```bash
yarn
yarn dev
```

The reason behind the folder structure: this makes it possible to also run it from inside the mono repo setup

## AUTH with NextAuth and keycloak

setup auth with keycloak in docker. 
The wfo-ui-formatics folder contains a docker compose file.

-   copy apps env: `cp wfo-ui-formatics/.env.example apps/wfo-ui-formatics/.env`.
    -   change `KEYCLOAK_ADMIN` and `KEYCLOAK_ADMIN_PASSWORD` to your own values.
    -   `NEXTAUTH_SECRET`: is NextAuth internal for JWT encryption and easily created with command `openssl rand -base64 32`.
    -   `NEXTAUTH_URL`: should be the base url to the auth page: `${FRONTEND_URL}/api/auth`.
    -   `NEXTAUTH_ID`: name of the provider which is shown in the `Sign in with {NEXTAUTH_ID}`, default is `keycloak`.
-   run `docker compose up -d` to start keycloak.
-   log into keycloak at http://localhost:8085
-   keycloak setup (use the `apps/{folder}` env):
    -   follow the [keycloak docs](https://www.keycloak.org/getting-started/getting-started-docker#_secure_the_first_application) to create a new realm and at least one user.
    -   after creating the realm, copy paste the url of the realm `http://{YOUR_KEYCLOAK_DOMAIN}/realms/{YOUR_REALM}` in your env as variable `NEXTAUTH_ISSUER`.
    -   Create a client.
        -   first page: fill in a name for `ClientID`. (`.env.example` default is `orchestrator-client`)
        -   second page: enable `Client authentication` and `Authorization`.
        -   third page fill in `Valid redirect URIs` and `Web Origins`:
            -   `Valid redirect URIs` with `{FRONTEND_URL}/api/auth/callback/{PROVIDER}`, with default provider its env variable `NEXTAUTH_ID`. (eg `http://localhost:3000/api/auth/callback/keycloak`)
            -   `Web Origins` with `{FRONTEND_URL}`. (eg `http://localhost:3000/`)
    -   go to the client details and go to tab `Credentials` and copy the Client secret and paste it into your env file. (`NEXTAUTH_CLIENT_SECRET`)
    -   run the app with `turbo dev`.
-   keycloak backend setup:
    -   Create another client in the same realm.
        -   first page: fill in a name for `ClientID`. (set the client id in your env (`OAUTH2_RESOURCE_SERVER_ID`)).
        -   second page: enable `Client authentication` and `Authorization`.
        -   third page: does not need any config.
    -   go to the client details and go to tab `Credentials` and copy the Client secret and pase it into your env file. (`OAUTH2_RESOURCE_SERVER_SECRET`)
    -   if you don't use authorization and only use authentication set `OAUTH2_AUTHORIZATION_ACTIVE` to `False`. if you do have authentication, you should set `OAUTH2_TOKEN_URL` to the inspection endpoint of your auth provider.
    -   run the backend.
