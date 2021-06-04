import {getOctokit} from '@actions/github';
import {getInput} from '@actions/core';
import {createHash} from 'crypto';
import {get} from 'https';
import {readFileSync, writeFileSync} from 'fs';

const myToken = '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'; // getInput('myToken');

const octokit = getOctokit(myToken);

async function update() {
  const release = await octokit.rest.repos.getLatestRelease({
    owner: 'no0dles',
    repo: 'hammerkit',
  });

  const linuxArm64 = `https://github.com/no0dles/hammerkit/releases/download/${release.data.tag_name}/hammerkit-linux-arm64`;
  const linuxAmd64 = `https://github.com/no0dles/hammerkit/releases/download/${release.data.tag_name}/hammerkit-linux-amd64`;
  const macosArm64 = `https://github.com/no0dles/hammerkit/releases/download/${release.data.tag_name}/hammerkit-macos-arm64`;
  const macosAmd64 = `https://github.com/no0dles/hammerkit/releases/download/${release.data.tag_name}/hammerkit-macos-amd64`;

  const hashes = await Promise.all([
    getHash(macosArm64),
    getHash(macosAmd64),
    getHash(linuxArm64),
    getHash(linuxAmd64),
  ]);

  const template = readFileSync('hammerkit.tmpl.rb').toString();
  const output = replaceAll(template, {
    VERSION: release.data.tag_name,
    'MACOS-ARM64-SHA256': hashes[0],
    'MACOS-AMD64-SHA256': hashes[1],
    'LINUX-ARM64-SHA256': hashes[2],
    'LINUX-AMD64-SHA256': hashes[3],
  });

  writeFileSync('Formula/hammerkit.rb', output);
}

function replaceAll(str: string, mapObj: { [key: string]: string }) {
  var re = new RegExp(Object.keys(mapObj).join('|'), 'gi');

  return str.replace(re, function (matched) {
    return mapObj[matched.toLowerCase()];
  });
}

function getHash(url: string): Promise<string> {
  const hash = createHash('sha256');
  return new Promise<string>((resolve, reject) => {
    get(url, (res) => {
      res.on('data', data => hash.update(data));
      res.on('error', err => reject(err));
      res.on('end', () => {
        resolve(hash.digest('hex'));
      });
    });
  });
}
