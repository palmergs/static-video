import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class SiteItemComponent extends Component {
  get current() {
    console.log(`SiteID = ${ this.args.siteID } Model ID = ${ this.args.model.id }`);
    return this.args.siteID == this.args.model.id;
  }
}
