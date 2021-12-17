[1mdiff --git a/front2/src/components/seguridad/register.vue b/front2/src/components/seguridad/register.vue[m
[1mindex 0e737f6..e78d105 100644[m
[1m--- a/front2/src/components/seguridad/register.vue[m
[1m+++ b/front2/src/components/seguridad/register.vue[m
[36m@@ -1,127 +1,37 @@[m
 <template>[m
[31m-  <div class="col-md-12">[m
[31m-    <div class="card card-container">[m
[31m-      <img[m
[31m-        id="profile-img"[m
[31m-        src="//ssl.gstatic.com/accounts/ui/avatar_2x.png"[m
[31m-        class="profile-img-card"[m
[31m-      />[m
[31m-      <Form @submit="handleRegister" :validation-schema="schema">[m
[31m-        <div v-if="!successful">[m
[31m-          <div class="form-group">[m
[31m-            <label for="username">Username</label>[m
[31m-            <Field name="username" type="text" class="form-control" />[m
[31m-            <ErrorMessage name="username" class="error-feedback" />[m
[31m-          </div>[m
[31m-          <div class="form-group">[m
[31m-            <label for="email">Email</label>[m
[31m-            <Field name="email" type="email" class="form-control" />[m
[31m-            <ErrorMessage name="email" class="error-feedback" />[m
[31m-          </div>[m
[31m-          <div class="form-group">[m
[31m-            <label for="password">Password</label>[m
[31m-            <Field name="password" type="password" class="form-control" />[m
[31m-            <ErrorMessage name="password" class="error-feedback" />[m
[31m-          </div>[m
[31m-[m
[31m-          <div class="form-group">[m
[31m-            <button class="btn btn-primary btn-block" :disabled="loading">[m
[31m-              <span[m
[31m-                v-show="loading"[m
[31m-                class="spinner-border spinner-border-sm"[m
[31m-              ></span>[m
[31m-              Sign Up[m
[31m-            </button>[m
[31m-          </div>[m
[31m-        </div>[m
[31m-      </Form>[m
[31m-[m
[31m-      <div[m
[31m-        v-if="message"[m
[31m-        class="alert"[m
[31m-        :class="successful ? 'alert-success' : 'alert-danger'"[m
[31m-      >[m
[31m-        {{ message }}[m
[31m-      </div>[m
[31m-    </div>[m
[32m+[m[32m  <div>[m
[32m+[m[32m      <form ref="formulario">[m
[32m+[m[32m        <label>Correo</label>[m
[32m+[m[32m          <input type="email" v-model="form.username">[m
[32m+[m[32m        <label>contraseña</label>[m
[32m+[m[32m        <input type="password" v-model="form.password">[m
[32m+[m
[32m+[m[32m      </form>[m
[32m+[m[32m        <button @click="registro">registrarse</button>[m
[32m+[m[32m        <br>[m
[32m+[m[32m        {{message}}[m
   </div>[m
 </template>[m
[31m-[m
 <script>[m
[31m-import { Form, Field, ErrorMessage } from "vee-validate";[m
[31m-import * as yup from "yup";[m
[31m-[m
[31m-export default {[m
[31m-  name: "Register",[m
[31m-  components: {[m
[31m-    Form,[m
[31m-    Field,[m
[31m-    ErrorMessage,[m
[31m-  },[m
[31m-  data() {[m
[31m-    const schema = yup.object().shape({[m
[31m-      username: yup[m
[31m-        .string()[m
[31m-        .required("Username is required!")[m
[31m-        .min(3, "Must be at least 3 characters!")[m
[31m-        .max(20, "Must be maximum 20 characters!"),[m
[31m-      email: yup[m
[31m-        .string()[m
[31m-        .required("Email is required!")[m
[31m-        .email("Email is invalid!")[m
[31m-        .max(50, "Must be maximum 50 characters!"),[m
[31m-      password: yup[m
[31m-        .string()[m
[31m-        .required("Password is required!")[m
[31m-        .min(6, "Must be at least 6 characters!")[m
[31m-        .max(40, "Must be maximum 40 characters!"),[m
[31m-    });[m
[31m-[m
[31m-    return {[m
[31m-      successful: false,[m
[31m-      loading: false,[m
[31m-      message: "",[m
[31m-      schema,[m
[31m-    };[m
[31m-  },[m
[31m-  computed: {[m
[31m-    loggedIn() {[m
[31m-      return this.$store.state.auth.status.loggedIn;[m
[31m-    },[m
[31m-  },[m
[31m-  mounted() {[m
[31m-    if (this.loggedIn) {[m
[31m-      this.$router.push("/profile");[m
[31m-    }[m
[31m-  },[m
[31m-  methods: {[m
[31m-    handleRegister(user) {[m
[31m-      this.message = "";[m
[31m-      this.successful = false;[m
[31m-      this.loading = true;[m
[31m-[m
[31m-      this.$store.dispatch("auth/register", user).then([m
[31m-        (data) => {[m
[31m-          this.message = data.message;[m
[31m-          this.successful = true;[m
[31m-          this.loading = false;[m
[32m+[m[32m  import instancia from "@/collection/archivo.js"[m
[32m+[m[32m  export default{[m
[32m+[m[32m    data(){[m
[32m+[m[32m      return{[m
[32m+[m[32m        form:{[m
[32m+[m[32m          'username':'',[m
[32m+[m[32m          'password':''[m
         },[m
[31m-        (error) => {[m
[31m-          this.message =[m
[31m-            (error.response &&[m
[31m-              error.response.data &&[m
[31m-              error.response.data.message) ||[m
[31m-            error.message ||[m
[31m-            error.toString();[m
[31m-          this.successful = false;[m
[31m-          this.loading = false;[m
[31m-        }[m
[31m-      );[m
[32m+[m[32m        message:''[m
[32m+[m[32m      }[m
     },[m
[31m-  },[m
[31m-};[m
[32m+[m[32m    methods:{[m
[32m+[m[32m      registro: function(){[m
[32m+[m[32m        instancia.post('register',this.form)[m
[32m+[m[32m        .then(this.message="se creo el usuario:   "+this.form.username)[m
[32m+[m[32m        this.$refs.formulario.reset()[m
[32m+[m[32m      }[m
[32m+[m[32m    }[m
[32m+[m[32m  }[m
 </script>[m
[31m-[m
[31m-<style scoped>[m
[31m-[m
[32m+[m[32m<style>[m
 </style>[m
[1mdiff --git a/front2/src/services/auth.service.js b/front2/src/services/auth.service.js[m
[1mindex 2b76213..9ab0408 100644[m
[1m--- a/front2/src/services/auth.service.js[m
[1m+++ b/front2/src/services/auth.service.js[m
[36m@@ -4,9 +4,9 @@[m [mconst API_URL = 'http://localhost:9988/api/';[m
 class AuthService {[m
   login(user) {[m
     return axios[m
[31m-      .post(API_URL + 'login_check', {[m
[32m+[m[32m      .post(API_URL + 'login_check', {username[m
         username: user.username,[m
[31m-        password: user.password[m
[32m+[m[32m        password: user.password,[m
       })[m
       .then(response => {[m
         if (response.data.accessToken) {[m
[36m@@ -22,7 +22,6 @@[m [mclass AuthService {[m
 [m
   register(user) {[m
     return axios.post(API_URL + 'register', {[m
[31m-      username: user.username,[m
       email: user.email,[m
       password: user.password[m
     });[m
