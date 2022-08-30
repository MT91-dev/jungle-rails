// Write a new feature spec that will test that users can navigate from the home page to the product detail page by clicking on a product

describe('Product details', () => {
  it.only('should redirect to a product detail page when a product is clicked', () => {
    cy.visit('/')
    cy.get(".products article").first().click()
    cy.url().should('include', '/products/')
  })
})