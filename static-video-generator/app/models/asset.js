import Model, { attr, belongsTo } from '@ember-data/model';

export default class AssetModel extends Model {
  @belongsTo('site') site;
  @attr('string') type;
  @attr('string') title;
  @attr('string') alt;
  @attr('string') filename;
  @attr('number') relOrder;
}
