AuthActions                    = require('actions/auth')
React                          = require('react')
{Row, Col, Input, ButtonInput} = require('react-bootstrap')

module.exports = React.createClass
  displayName: 'Login'

  getInitialState: ->
    {
      email: ''
      password: ''
    }

  login: (e) ->
    e.preventDefault()
    AuthActions.requestLogin(@state.email, @state.password)

  render: ->
    <Row>
      <Col md={6} mdOffset={3} xs={12} xsOffset={0}>
        <form onSubmit={@login}>
          <Input type='text' label='Email' placeholder='Email' value={@state.email} onChange={ (e) => @setState(email: e.target.value) } />
          <Input type='password' label='Password' placeholder='Password' value={@state.password} onChange={ (e) => @setState(password: e.target.value) } />
          <ButtonInput bsStyle='primary' type='submit' value='Sign In' />
        </form>
      </Col>
    </Row>
