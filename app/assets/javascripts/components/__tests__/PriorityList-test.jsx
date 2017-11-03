import PriorityList from "../priority_list";

describe("PriorityList", function () {
  describe("#render()", function () {
    it("shows all of the priorities present", function () {
      const state = {
        priorities: [
          {
            card_type: "Province",
            sequence: 1
          },
          {
            card_type: "Gold",
            sequence: 1
          },
          {
            card_type: "Silver",
            sequence: 1
          }

        ]
      }

      const renderedComponent = TestUtils.renderIntoDocument(
        <PriorityList
          priorities={state.priorities}
        />
      )

      expect(ReactDOM.findDOMNode(renderedComponent).textContent).
        to.eq("ProvinceGoldSilver");
    });
  });
});
