import Route from '@ember/routing/route';

export default class SitesRoute extends Route {
  async model() {
    return this.store.findAll('site');
  }
}
