//Create and validate project
export const createProject = () => {
  cy.visit(Cypress.env('url'))
  cy.get('button[class="btn btn-secondary ng-star-inserted"]').click()
  cy.get('input[id="create_project_name"]').type(Cypress.env('project'))
  cy.get('button[id="new-project-ok"]').click()
  cy.get('.alert-text').should('contain', 'Created project successfully')
}

//Remove project and confirm deletion
export const deleteProject = () => {
  cy.get('div[role="row"]')
    .filter((index, element) => {
      return Cypress.$(element).text().includes(Cypress.env('project'));
    })
    .find('input[type="checkbox"]')
    .check({force: true});
  cy.contains('span', 'ACTION').click()
  cy.get('button[id="delete-project"]').click()
  cy.contains('button', 'DELETE').click();
  cy.get('.alert-text').should('contain', 'Deleted successfully')
}

describe('template spec', () => {
  it('.should() - allow user to signin', () => {
    cy.visit(Cypress.env('url') + '/account/sign-in', { retryOnStatusCodeFailure: true })
    cy.get('input[placeholder="Username"]').type(Cypress.env('user'))
    cy.get('input[placeholder="Password"]').type(Cypress.env('harbor_password'))
    cy.get('[type="checkbox"]').check({force: true})
    cy.get('button[id="log_in"]').click()
    cy.wait(10000)
  })
  it('Create and delete project', () => {
    createProject()
    deleteProject()
  })
})
