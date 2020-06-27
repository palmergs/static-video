import Model, { attr, hasMany } from '@ember-data/model';

export default class SiteModel extends Model {
  @attr('string') title;
  @attr('string') subtitle;
  @attr('string') descr;
  @hasMany('asset') assets;
}
