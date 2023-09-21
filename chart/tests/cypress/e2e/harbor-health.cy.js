context('Assertions', () => {
  before(() => {
    cy.visit(Cypress.env('url') + '/account/sign-in')
  })

  describe('template spec', () => {
    // test sign-in
    it('.should() - allow user to signin', () => {

      // /users/sign_up is throwing an uncaught exception - we can continue the test by ignoring this single error
      cy.on('uncaught:exception', (err, runnable) => {
        expect(err.message).to.include('Cannot read')

        return false
      })

      // wait to load page
      cy.wait(2000)
      // validate signin page
      cy.title().should('include', 'Harbor')
      // enter credentials from values.yaml
      cy.get('input[placeholder="Username"]').type(Cypress.env('user'))
      cy.get('input[placeholder="Password"]').type(Cypress.env('harbor_password'))
      cy.get('button[id="log_in"]').click()
      // validate landing page after successful login
      cy.get('h2.header-title').first().contains('Projects')

    })
    // test creating a project
    it('.and() - user can create a new project', () => {
      // /users/sign_up is throwing an uncaught exception - we can continue the test by ignoring this single error
      cy.on('uncaught:exception', (err, runnable) => {
        expect(err.message).to.include('Cannot read')

        return false
      })
      cy.visit(Cypress.env('url'))
      cy.wait(2000)
      // Click "Create Project" button to open modal
      cy.get('button[class="btn btn-secondary ng-star-inserted"]').click()
      // enter test project name
      cy.get('input[id="create_project_name"]').type(Cypress.env('project'))
      cy.get('button[id="new-project-ok"]').click()
      // validate new project exists
      cy.contains(Cypress.env('project'))
    })
  })
})
