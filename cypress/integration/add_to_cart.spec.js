describe('Add to Cart Feature', () => {

  it('adds product to and increases cart by 1', () => {
    cy.visit('http://localhost:3000')
    cy.contains("My Cart (0)")
    cy.get(".btn").first().click({force: true})
    cy.contains("My Cart (1)")
  });
})