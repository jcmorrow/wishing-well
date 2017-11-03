import Priority from "../priority";

describe("Priority component", function () {
  describe("#render()", function () {
    it("should display the card type of the priority", function () {
      const state = {
        priority: {
          card_type: "Province"
        }
      }

      class PriorityTester extends React.Component {
        render () {
          return (<Priority {...this.props} />);
        }
      }

      const renderedComponent = TestUtils.renderIntoDocument(
        <PriorityTester {...state.priority} />
      );

      expect(ReactDOM.findDOMNode(renderedComponent).textContent).
        to.equal("Province");
    });
  });
});
