import { SpaDemoPage } from './app.po';

describe('spa-demo App', () => {
  let page: SpaDemoPage;

  beforeEach(() => {
    page = new SpaDemoPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!!');
  });
});
