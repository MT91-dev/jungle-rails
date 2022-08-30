describe('Home page', () => {
  it('should display a list of products', () => {
    cy.visit('/')
    cy.get(".products article").should('be.visible')
  }),
  it("There is 2 products on the page", () => {
    cy.visit('/')
    cy.get(".products article").should("have.length", 2);
  })
})
