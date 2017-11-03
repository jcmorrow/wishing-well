import { expect } from 'chai';
import React from 'react';
import ReactDOM from "react-dom";
import ReactTestUtils from 'react-addons-test-utils';
import jsdom from 'jsdom';

global.React = React;
global.ReactDOM = ReactDOM;
global.TestUtils = ReactTestUtils;
global.expect = expect;

global.document = jsdom.jsdom('<!doctype html><html><body></body></html>');
global.window = document.defaultView;
