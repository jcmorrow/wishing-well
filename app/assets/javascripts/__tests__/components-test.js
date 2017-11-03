import Components from "../components.es6";

describe('window', function() {
  describe('WinRateDisplay', function () {
    it('should be defined', function () {
      expect(window.WinRateDisplay).to.be_defined;
    });
  });
  describe('TurnSummary', function () {
    it('should be defined', function () {
      expect(window.TurnSummary).to.be_defined;
    });
  });
  describe('PriorityList', function () {
    it('should be defined', function () {
      expect(window.PriorityList).to.be_defined;
    });
  });
  describe('DeckList', function () {
    it('should be defined', function () {
      expect(window.DeckList).to.be_defined;
    });
  });
})
