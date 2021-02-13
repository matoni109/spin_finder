import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'approved' ];
  static targets = [ 'denied' ];

  connect() {
    console.log(this.statusTargets);
  }
}
