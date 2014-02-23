Router.map ->

  @route "entrySignIn",
    template: AccountsEntry.settings.signInTemplate
    path: "/sign-in"
    before: ->
      Session.set('entryError', undefined)
      Session.set('buttonText', 'in')

  @route "entrySignUp",
    template: settings.signUpTemplate
    path: "/sign-up"
    before: ->
      Session.set('entryError', undefined)
      Session.set('buttonText', 'up')

  @route "entryForgotPassword",
    template: settings.forgotPasswordTemplate
    path: "/forgot-password"
    before: ->
      Session.set('entryError', undefined)

  @route 'entrySignOut',
    template: settings.signOutTemplate
    path: '/sign-out'
    before: ->
      Session.set('entryError', undefined)
      if AccountsEntry.settings.homeRoute
        Meteor.logout () ->
          Router.go settings.homeRoute
      @stop()

  @route 'entryResetPassword',
    template: settings.resetPasswordTemplate
    path: 'reset-password/:resetToken'
    before: ->
      Session.set('entryError', undefined)
      Session.set('resetToken', @params.resetToken)
