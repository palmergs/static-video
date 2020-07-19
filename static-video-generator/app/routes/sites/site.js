import Route from '@ember/routing/route';

export default class SitesSiteRoute extends Route {
  async model(params) {
    return this.store.findRecord('site', params.site_id);
  }
}
