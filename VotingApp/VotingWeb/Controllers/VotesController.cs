// ------------------------------------------------------------
//  Copyright (c) Microsoft Corporation.  All rights reserved.
//  Licensed under the MIT License (MIT). See License.txt in the repo root for license information.
// ------------------------------------------------------------

namespace VotingWeb.Controllers
{
    using Microsoft.AspNetCore.Mvc;
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    using System.Fabric;
    using System.Net.Http;
    using System.Net.Http.Headers;
    using System.Text;
    using System.Threading.Tasks;

    [Produces("application/json")]
    [Route("api/[controller]")]
    public class VotesController : Controller
    {
        private readonly HttpClient httpClient;
        private readonly FabricClient fabricClient;
        private readonly string reverseProxyBaseUri;
        private readonly StatelessServiceContext serviceContext;

        public VotesController(HttpClient httpClient, StatelessServiceContext context, FabricClient fabricClient)
        {
            this.fabricClient = fabricClient;
            this.httpClient = httpClient;
            this.serviceContext = context;
            this.reverseProxyBaseUri = Environment.GetEnvironmentVariable("ReverseProxyBaseUri");
        }

        // GET: api/Votes
        [HttpGet("")]
        public async Task<IActionResult> Get()
        {
            Uri serviceName = VotingWeb.GetVotingDataServiceName(this.serviceContext);
            Uri proxyAddress = this.GetProxyAddress(serviceName);

            List<KeyValuePair<string, int>> result = new List<KeyValuePair<string, int>>();

            string proxyUrl = $"{proxyAddress}/api/VoteData";

            using (HttpResponseMessage response = await this.httpClient.GetAsync(proxyUrl))
            {
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    result.AddRange(JsonConvert.DeserializeObject<List<KeyValuePair<string, int>>>(await response.Content.ReadAsStringAsync()));
                }
            }

            return this.Json(result);
        }

        // PUT: api/Votes/name
        [HttpPut("{name}")]
        public async Task<IActionResult> Put(string name)
        {
            Uri serviceName = VotingWeb.GetVotingDataServiceName(this.serviceContext);
            Uri proxyAddress = this.GetProxyAddress(serviceName);
            string proxyUrl = $"{proxyAddress}/api/VoteData/{name}";

            StringContent putContent = new StringContent($"{{ 'name' : '{name}' }}", Encoding.UTF8, "application/json");
            putContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");

            using (HttpResponseMessage response = await this.httpClient.PutAsync(proxyUrl, putContent))
            {
                return new ContentResult()
                {
                    StatusCode = (int)response.StatusCode,
                    Content = await response.Content.ReadAsStringAsync()
                };
            }
        }

        // DELETE: api/Votes/name
        [HttpDelete("{name}")]
        public async Task<IActionResult> Delete(string name)
        {
            Uri serviceName = VotingWeb.GetVotingDataServiceName(this.serviceContext);
            Uri proxyAddress = this.GetProxyAddress(serviceName);
            string proxyUrl = $"{proxyAddress}/api/VoteData/{name}";

            using (HttpResponseMessage response = await this.httpClient.DeleteAsync(proxyUrl))
            {
                if (response.StatusCode != System.Net.HttpStatusCode.OK)
                {
                    return this.StatusCode((int)response.StatusCode);
                }
            }

            return new OkResult();
        }


        /// <summary>
        /// Constructs a reverse proxy URL for a given service.
        /// Example: http://localhost:19081/VotingApplication/VotingData/
        /// </summary>
        /// <param name="serviceName"></param>
        /// <returns></returns>
        private Uri GetProxyAddress(Uri serviceName)
        {
            return new Uri($"{this.reverseProxyBaseUri}{serviceName.AbsolutePath}");
        }
    }
}