describe('Product Details Page', () => {

  it('successfully navigates from the home page to the product detail page by clicking on a product', () => {
    cy.visit('http://localhost:3000')
    cy.get(".products article").first().click()
    cy.location('pathname').should('eq', '/products/12')
  });

})