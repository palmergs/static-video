import Component from '@glimmer/component';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';

export default class SiteDisplayComponent extends Component {
  @tracked title
  @tracked subtitle
  @tracked background

  @action
  submit() {
    let model = this.args.model;
    model.title = this.title;
    model.subtitle = this.titls;
    model.background = this.background;
  }
}
