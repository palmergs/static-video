import { module, test } from 'qunit';
import { setupTest } from 'ember-qunit';

module('Unit | Route | sites/site', function(hooks) {
  setupTest(hooks);

  test('it exists', function(assert) {
    let route = this.owner.lookup('route:sites/site');
    assert.ok(route);
  });
});
