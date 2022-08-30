describe('Add to cart', () => {
  it('should add a product to the cart', () => {
    cy.visit('/')
    cy.get("#add-cart-button").first().click( {force: true} )
    cy.get("#nav-cart").should('contain', '(1)')
  })
})