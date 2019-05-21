const server = require('../src/server');
const request = require('supertest');

afterEach((done) => {
  server.close();

  done();
});

describe('Testing Koa Server', () => {
  describe('서버 작동', () => {
    it ('it should return 200 status code', async () => {
      const response = await request(server).get('/test');
      await expect(response.status).toEqual(200);
    });
  });
});
