Ch.SidebarParticipationComponent = Ember.Component.extend({
  actions: {
    focusOnNewLinkForm: function() {
      $('section#links-new').find('input#name').focus();
      $('section#links-new').css('border', '1px solid blue');
    }
  }
});