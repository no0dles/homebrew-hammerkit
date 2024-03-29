import {getOctokit} from '@actions/github';
import {getInput} from '@actions/core';
import {createHash} from 'crypto';
import {get} from 'https';
import {readFileSync, writeFileSync} from 'fs';

const myToken = process.env.GITHUB_TOKEN as string;

const octokit = getOctokit(myToken);

async function update() {
  const release = await octokit.rest.repos.getLatestRelease({
    owner: 'no0dles',
    repo: 'hammerkit',
  });

  const macosArm64 = `https://github.com/no0dles/hammerkit/releases/download/${release.data.tag_name}/hammerkit-macos-arm64`;
  const macosAmd64 = `https://github.com/no0dles/hammerkit/releases/download/${release.data.tag_name}/hammerkit-macos-x64`;
  const linuxArm64 = `https://github.com/no0dles/hammerkit/releases/download/${release.data.tag_name}/hammerkit-linux-arm64`;
  const linuxAmd64 = `https://github.com/no0dles/hammerkit/releases/download/${release.data.tag_name}/hammerkit-linux-x64`;

  const hashes = await Promise.all([
    getHash(macosArm64),
    getHash(macosAmd64),
    getHash(linuxArm64),
    getHash(linuxAmd64),
  ]);

  console.log(hashes)
  const template = readFileSync('hammerkit.rb.tmpl').toString();
  const output = replaceAll(template, {
    VERSION: release.data.tag_name,
    'MACOS-ARM64-SHA256': hashes[0],
    'MACOS-AMD64-SHA256': hashes[1],
    'LINUX-ARM64-SHA256': hashes[2],
    'LINUX-AMD64-SHA256': hashes[3],
  });

  console.log('write Formula/hammerkit.rb')
  writeFileSync('Formula/hammerkit.rb', output);
}

function replaceAll(str: string, mapObj: { [key: string]: string }) {
  var re = new RegExp(Object.keys(mapObj).map(k => `{{${k}}}`).join('|'), 'gi');
  return str.replace(re, function (matched) {
    return mapObj[matched.substr(2,matched.length-4)];
  });
}

function getHash(url: string): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    const req = get(url, (res) => {
      if(res.statusCode === 302 && res.headers.location) {
        getHash(res.headers.location).then(resolve).catch(reject);
      } else {
        const hash = createHash('sha256');
        res.on('data', data => {
          hash.update(data)
        });
        res.on('end', () => {
          resolve(hash.digest('hex'));
        });
      }
    });
    req.on('error', err => reject(err));
    req.end();
  });
}

update()
